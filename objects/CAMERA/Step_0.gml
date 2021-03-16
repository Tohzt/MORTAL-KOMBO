/// @description Insert description here
// You can write your code in this editor

// Stay Between Fighters
x = SYSTEM.Player_One.x + (SYSTEM.Player_Two.x - SYSTEM.Player_One.x)/2;

x = min(SYSTEM.Camera_Center*2 - 450 ,x);