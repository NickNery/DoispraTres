local dlg = Dialog{ title = "DoispraTres" }

dlg:slider{
  id = "angle",
  label = "Ângulo",
  min = 1,
  max = 45,
  value = 26
}

dlg:button{
  id = "btn_grid",
  text = "Gerar Grade Isométrica",
  onclick = function()
  end
}

dlg:show{ wait = false }
