active = false;
teeMarkerCount = array_length(TEE_DATA.teeOrder);

var sep = 40;
width = 300;
height = sep*teeMarkerCount;

highlightedTee = undefined;

yposStart = y;
yposEnd = y;

animationValue = 0;
animationValueEnd = 0;

editTeeStruct = undefined;