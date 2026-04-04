# DMux4Way

This diagram shows the hierarchical structure of the `DMux4Way` chip:

```
                 in
                  |
                DMux
               sel[1]
              /      \
             /        \
        (left)        (right)
         /              \
      DMux              DMux
     sel[0]            sel[0]
     /   \             /   \
    a     b           c     d
```

The truth table
```
| sel[1] | sel[0] | Output |
| ------ | ------ | ------ |
| 0      | 0      | a      |
| 0      | 1      | b      |
| 1      | 0      | c      |
| 1      | 1      | d      |
```
