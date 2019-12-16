Sub Main
	'============================================
	'Prompts user to select a number of elements, then lists the elements
	'and their associated nodes to the message window. The list uses
	'a fixed-width format intended to be copied and pasted into Excel.
	'
	'Written by AMJ 12.13.2019
	'
	'Changes in v1 (12.16.2019)
	'-Changed output to list the Element ID, followed by its associated
	'  nodes all in a single row.
	'============================================
    Dim App as femap.model
    Set App = feFemap()

    'Prompt user for elements to list
    Dim elemSet As femap.Set
    Set elemSet = App.feSet
    Dim iterElem As femap.Elem
    Set iterElem = App.feElem
    Dim iterNode As femap.Node
    Set iterode = App.feNode

    elemSet.Select(FT_ELEM,True,"Select Elements to List Nodes")

    'List elements and nodes
	Dim line1 As String
	'Dim line2 As String
	Dim size As Integer
	Dim i As Long
	Dim nodeID As Long

	size = 12	'width of each output column

	App.feAppMessage(FCM_NORMAL,"Listing selected elements and nodes for pasting into Excel")
	App.feAppMessage(FCM_NORMAL,"Format:")

	App.feAppMessageStartListing()
	App.feAppMessage(FCM_NORMAL,PadString("Element",size)&PadString("Node 1",size)&PadString("Node 2",size)&PadString("Etc...",size))
	'App.feAppMessage(FCM_NORMAL,"Node List")
	App.feAppMessage(FCM_NORMAL,"-----------------------------")
	elemSet.Reset
	While elemSet.Next
		iterElem.Get(elemSet.CurrentID)
		line1 = PadString(Str(iterElem.ID),size)
		i = 1
		'line2 = PadString("Node(s) ",size)
		For Each item In iterElem.Nodes
			If item <> 0 Then
				line1 = line1 & PadString(Str(item),size)
			End If
		Next
		App.feAppMessage(FCM_NORMAL,line1)
		'App.feAppMessage(FCM_NORMAL,line2)
	Wend
	App.feAppMessageEndListing()
    
End Sub

Public Function PadString(ByVal raw As String, size As Integer) As String
	'====================================================
	'Accepts a string and pads it on the right side with spaces to make it equal
	'length 'size.' If string is longer than size, it will be truncated.
	'====================================================
	Dim padded As String

	If Len(raw) >=size Then
		raw = Mid(raw,1,size)
		PadString = raw
		Exit Function
	End If
	padded = Mid(raw & String(size - Len(raw)," "),1)

	PadString = padded

End Function
