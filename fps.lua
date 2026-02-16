-- Script de Otimização Turbo (FPS BOOST v2)
local Lighting = game:GetService("Lighting")
local Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")

-- 1. Reduz qualidade do terreno e iluminação
if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
    Terrain.Decoration = false -- Remove a grama 3D
end

Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1

-- 2. Limpa o mapa e remove efeitos de câmera pesados
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
        -- Se for MeshPart (comum no Defusal), remove a textura pesada
        if v:IsA("MeshPart") then
            v.TextureID = "" 
        end
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    elseif v:IsA("PostProcessEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") then
        v.Enabled = false -- Desliga efeitos de borrão e brilho do sol
    elseif v:IsA("Sound") and not v.Playing then
        v:Destroy() -- Remove sons que não estão tocando para liberar RAM
    end
end

print("Otimização Turbo Concluída!")
