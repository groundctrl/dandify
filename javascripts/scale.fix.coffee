---
---

metas = document.getElementsByTagName("meta")
i     = undefined

if navigator.userAgent.match(/iPhone/i)
  i = 0
  while i < metas.length
    metas[i].content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0"  if metas[i].name is "viewport"
    i++
  document.addEventListener "gesturestart", gestureStart, false

gestureStart = ->
  i = 0
  while i < metas.length
    metas[i].content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6"  if metas[i].name is "viewport"
    i++
  return
