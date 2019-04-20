# PLLabel - thoroughly unfinished

This nano-library defines 'Label's which are either `Descriptive`, in which
case they fully describe the thing they label, or they are `Enhancing`, in
which case they enhance but do not replace somethings description.

The intention is that datastructures that contain labels can be recursed down, 
accumulating enhancing labels and using descriptive labels as break points. If 
a descriptive label is found, recursion can stop as the meaning of further
labels should be encapsulated by the descriptive label. This functionality is
currently delegated.

