function codewords = huff(sym,prob)
sym=num2cell(sym);
tree = struct('signal', [], 'probability', [],'child', [], 'code', []);
for i = 1:length( sym )
    tree(i).signal = sym{i}; 
    tree(i).probability = prob(i); 
end
tree = create_tree(tree); 
[~,codewords]=coding(tree,{});
end

function tree = create_tree(tree)

if( 1 == length(tree))
    return;
end
temp = struct('signal', [], 'probability', 0,'child', [], 'code', []);


for i = 1:2
    if isempty(tree) 
        break; 
    end
    temp.probability = temp.probability + tree(1).probability; % for ascending order
    temp.child{i} = tree(1);
    tree(1) = [];
end
tree = insertMaxVar(tree, temp);
tree = create_tree(tree);
end

function tree = insertMaxVar(tree, newNode)
i = 1;
while i <= length(tree) && newNode.probability > tree(i).probability 
    i = i+1;
end
tree = [tree(1:i-1) newNode tree(i:end)];
end
%good
function [tree,codew] = coding(tree,codew)
if isempty(tree.child)
    codew{1,end+1} = tree.code;
    codew{2,end} = tree.signal;
    return;
end
tree.child{1}.code = [tree(end).code, 1];
[tree.child{1}, codew] = coding(tree.child{1}, codew);
tree.child{2}.code = [tree(end).code, 0];
[tree.child{2}, codew] = coding(tree.child{2}, codew);

end
