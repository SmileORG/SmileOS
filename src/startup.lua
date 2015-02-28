pcall(dofile("os.config"))
setfenv(pcall(dofile("lang/"..config.lang..".lang")),getfenv())
term.setBackgroundColor(colors.white)
