# Femap---List-Nodes-on-Elements
List selected elements and their associated nodes in a fixed-width column format for use in Excel

See also: [How to use Femap Scripts](https://github.com/aaronjasso/How_to_use_Femap_Scripts) and [The List of my Femap Scripts](https://github.com/aaronjasso/My-Femap-Scripts)

---

Select any number of elements and they will be listed along with their nodes in the message window. Paste the list into Excel and use the Text-to-Columns button to populate the cells with the ID data.

#### New in v1:
-Rewrote output format to list the Element ID followed by its associated nodes on a single line. Output now looks similar to this:

```
Element     Node 1      Node 2      Etc...      
-----------------------------
 53519187    53524863    53522088   
 53519188    53524862    53524863   
 53519189    53524861    53524862   
 53519190    53524860    53524861   
 53519191    53524859    53524860   
 53521908    53523605    53523694    53523673    53523606   
 53521950    53523606    53523673    53523758    53523607   
 53521951    53523758    53523673    53523674    53523665   
 53521952    53523608    53523607    53523758    53523665   
 53521953    53523666    53523665    53523674    53523675   
 53521954    53523650    53523666    53523675    53523651   
 53521964    53523649    53523661    53523666    53523650   
 53521965    53523665    53523666    53523661    53523660   
 53521966    53523608    53523665    53523660    53523609   
```
