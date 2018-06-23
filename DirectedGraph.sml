
local

fun member(x,[]) = false
 |   member(x,b::y) = if x=b then true
                      else member(x,y)

fun getStartEdge(s,[])= []
        | getStartEdge(s,(a,b)::ls) = if a=s then [(a,b)] else getStartEdge(s,ls);

fun OrderEdgeInput(s, d, nil, connode, remaining,orgStart,orgNode) = connode @ remaining
        | OrderEdgeInput(s, d, (a,b)::ls, connode, remaining,orgStart,orgNode) = if getStartEdge(orgStart,orgNode)=[] then []
                                                      else if connode = [] then OrderEdgeInput(#2 (hd(getStartEdge(orgStart,orgNode))),d, (a,b)::ls, getStartEdge(orgStart,orgNode), remaining,orgStart,orgNode)
                                                      else if a=s then OrderEdgeInput(b,d,ls,connode@[(a,b)],remaining,orgStart,orgNode)    
                                                      else if remaining=[] then OrderEdgeInput(s,d,ls,connode,[(a,b)],orgStart,orgNode)
                                                      else if b = d then OrderEdgeInput(s,d,ls,connode,remaining@[(a,b)],orgStart,orgNode) 
                                                      else OrderEdgeInput(s,d,ls,connode,[(a,b)]@remaining,orgStart,orgNode)

fun check(s:int, d:int, [],nodes)                =  false
   | check(s:int, d:int, (a,b)::ls, nodes)              = if a = s 
                                                                  then if b = d then true
                                                                       else if null nodes
                                                                                then check(s, d, ls, [a]@[b])
                                                                        else check(s, d, ls, nodes@[a]@[b])
                                                          else if b = d then if member(a,nodes) then true
                                                                             else check(s, d, ls, nodes)
                                                          else if member(a,nodes) then check(s, d, ls, nodes@[a]@[b])
                                                            else check(s, d, ls, nodes);
in


fun path(xl:(int*int)list,s,d) = check(s, d, OrderEdgeInput(s, d, xl, [], [], s,xl), []) 

end;

