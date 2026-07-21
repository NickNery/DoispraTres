local function getLayerImage(layerName)
  local sprite = app.activeSprite

  if not sprite then
    return nil
  end

  for _, layer in ipairs(sprite.layers) do
    if layer.name == layerName then
      local cel = layer:cel(app.activeFrame)

      if cel then
        return cel.image
      end

      return nil
    end
  end

  return nil
end

local dialog = Dialog{ title = "DoispraTres" }

dialog:slider{
  id = "angle",
  label = "Ângulo",
  min = 1,
  max = 45,
  value = 26
}

dialog:button{
  id = "btn_grid",
  text = "Atualizar Visor",
  onclick = function()
    dialog:repaint()
  end
}

dialog:canvas{
  id = "visor",
  width = 300,
  height = 200,
  onpaint = function(ev)
    local imgFrente = getLayerImage("Frente")
    local imgLado = getLayerImage("Lado")
    local gc = ev.context

    ev.context.color = Color{ r = 40, g = 40, b = 40 }
    gc:fillRect(Rectangle(0, 0, 300, 200))

    if imgFrente then
      gc:drawImage(imgFrente, 10, 50)
    end

    if imgLado then
      gc:drawImage(imgLado, 160, 50)
    end
  end
}

dialog:show{ wait = false }
