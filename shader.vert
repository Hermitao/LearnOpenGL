#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;
layout (location = 2) in vec3 aColor;


uniform float offsetx;
uniform float offsety;
uniform float variableColor;

uniform mat4 transform;

out vec3 ourColor;
out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
   //gl_Position = transform * vec4(aPos, 1.0);
   gl_Position = projection * view * model * vec4(aPos, 1.0);
   ourColor = vec3(aColor.x, aColor.y, variableColor);
   TexCoord = vec2(aTexCoord.x, 1.0 - aTexCoord.y);
}