animationValue = lerp(animationValue,animationValueEnd,0.2);

var ydiff = (yposStart-yposEnd);
y = yposStart-(animationValue*ydiff);
