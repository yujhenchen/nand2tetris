# Mux4Way16 (16-bit)

This diagram shows the hierarchical structure of the `Mux4Way16` chip:

```
      sel[0]
     /      \
 Mux16      Mux16
(a, b)     (c, d)
   |          |
    \        /
      Mux16
      sel[1]
        |
       out
```
