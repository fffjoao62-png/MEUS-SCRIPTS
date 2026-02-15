-- Script de Otimização (FPS BOOST)
local Lighting = game:GetService("Lighting")
local Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")

-- 1. Reduz qualidade do terreno e iluminação
if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
end

Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1

-- 2. Limpa o mapa (Remove texturas e efeitos pesados)
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
        v.Material = Enum.Material.SmoothPlastic -- Deixa tudo "liso"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy() -- Remove adesivos e texturas que pesam
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false -- Desliga partículas
    elseif v:IsA("PostProcessEffect") then
        v.Enabled = false -- Desliga Bloom, Blur, etc.
    end
end

print("Jogo otimizado com sucesso!")
