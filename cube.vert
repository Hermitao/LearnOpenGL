#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

uniform float offsetx;
uniform float offsety;
uniform float variableColor;

uniform mat4 transform;

//out vec3 ourColor;
//out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoords;

void main()
{
   //gl_Position = transform * vec4(aPos, 1.0);
   FragPos = vec3(model * vec4(aPos, 1.0));
   Normal = mat3(transpose(inverse(model))) * aNormal;

   gl_Position = projection * view * vec4(FragPos, 1.0);
   TexCoords = aTexCoords;
   /*ourColor = vec3(aColor.x, aColor.y, variableColor);
   TexCoord = vec2(aTexCoord.x, 1.0 - aTexCoord.y);*/
}