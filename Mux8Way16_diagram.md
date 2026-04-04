# Mux8Way16 (16-bit)

This diagram shows the hierarchical structure of the `Mux8Way16` chip:

```
           sel[0]
         /       \
    Mux4Way16   Mux4Way16
   (a,b,c,d)  (e,f,g,h)
       |          |
        \        /
         Mux4Way16
           sel[1]
             |
             \
             Mux16
             sel[2]
               |
              out
```
