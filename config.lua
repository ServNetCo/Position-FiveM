Config = {}

-- Intervalle de rafraîchissement du texte (en ms)
-- 500ms suffit largement, inutile de vérifier la rue à chaque frame
Config.UpdateInterval = 500

-- Position du texte à l'écran (coordonnées relatives 0.0 -> 1.0)
-- Ces valeurs par défaut sont calées juste au dessus de la minimap
-- classique (résolution 16:9, HUD par défaut, sans mods de minimap custom)
Config.Position = {
    x = 0.045,
    y = 0.858
}

-- Si tu utilises une minimap agrandie ou repositionnée (ESX, QBCore custom HUD, etc.)
-- ajuste simplement Config.Position.y (et x si besoin) pour recaler le texte

Config.Scale = 0.33          -- taille du texte
Config.Font = 4              -- police (4 = police "chalet" condensée, look GTA)
Config.Outline = true        -- contour noir pour la lisibilité

Config.Color = { r = 255, g = 255, b = 255, a = 220 }

-- Affiche aussi le nom du quartier/zone (ex: "Vinewood Hills") sous la rue
Config.ShowZone = true
Config.ZoneScale = 0.28
Config.ZoneColor = { r = 200, g = 200, b = 200, a = 200 }

-- Masque le texte quand la minimap n'est pas affichée
-- (menu pause, radar désactivé via script, etc.)
Config.HideWithMinimap = true
