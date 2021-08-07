% Huffman Coding: We have sent an ascending order of probabilites and their
% corresponding symbols. We will choose the 2 nodes with least
% probability and create a parent node with them as children and
% probability as sum of both. Then, put the parent in the correct place in
% the list.
% Using this procedure we can build a tree. After building the tree, we can
% assign codewords by simple tree traversal.
%good
function codewords = huff(sym,prob)
tree = struct('symbol', [], 'probability', [],'child', [], 'code', []);
for i = 1:length(sym)
    tree(i).symbol = sym(i); 
    tree(i).probability = prob(i); 
end % Tree creation and assigning probabilities.
tree = create_tree(tree); % Function to build the tree.
codewords={};
[~,codewords]=coding(tree,codewords); % Creates codewords.
end

function tree = create_tree(tree) % Recursive function used to build the
% code tree.

if(length(tree)==1) % Once we have one parent node remaining, we return.
    return;
end
temp = struct('symbol', [], 'probability', 0,'child', [], 'code', []);
% If more nodes are present, we create a temp parent node.

for i = 1:2
    if isempty(tree) 
        break; 
    end
    temp.probability = temp.probability + tree(1).probability;
    temp.child{i} = tree(1);
    tree(1) = [];% Removing top-most node
end
tree = insertMaxVar(tree, temp);% To insert node such that the list is sorted.
tree = create_tree(tree);
end

function tree = insertMaxVar(tree, newNode) % Utility function
i = 1;
while i <= length(tree) && newNode.probability > tree(i).probability 
    i = i+1;
end
tree = [tree(1:i-1) newNode tree(i:end)];
end

function [tree,codew] = coding(tree,codew) % Recursive function which does 
% pre-order traversal of the tree to build the codewords.
if isempty(tree.child) % If on leaf of tree
    codew{1,end+1} = tree.code; % Create new entry and add code and symbol.
    codew{2,end} = tree.symbol;
    return;
end
tree.child{1}.code = [tree(end).code, 0];
[tree.child{1}, codew] = coding(tree.child{1}, codew);
tree.child{2}.code = [tree(end).code, 1];
[tree.child{2}, codew] = coding(tree.child{2}, codew);

end
