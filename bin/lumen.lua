environment = {{}}
target = "lua"
function nil63(x)
  return(x == nil)
end
function is63(x)
  return(not nil63(x))
end
function _35(x)
  return(#x)
end
function none63(x)
  return(_35(x) == 0)
end
function some63(x)
  return(_35(x) > 0)
end
function one63(x)
  return(_35(x) == 1)
end
function two63(x)
  return(_35(x) == 2)
end
function hd(l)
  return(l[1])
end
function string63(x)
  return(type(x) == "string")
end
function number63(x)
  return(type(x) == "number")
end
function boolean63(x)
  return(type(x) == "boolean")
end
function function63(x)
  return(type(x) == "function")
end
function obj63(x)
  return(type(x) == "table")
end
function atom63(x)
  return(nil63(x) or string63(x) or number63(x) or boolean63(x))
end
nan = 0 / 0
inf = 1 / 0
function nan63(n)
  return(not( n == n))
end
function inf63(n)
  return(n == inf or n == -inf)
end
function clip(s, from, upto)
  return(string.sub(s, from + 1, upto))
end
function cut(x, from, upto)
  local l = {}
  local j = 0
  local _e
  if nil63(from) or from < 0 then
    _e = 0
  else
    _e = from
  end
  local i = _e
  local n = _35(x)
  local _e1
  if nil63(upto) or upto > n then
    _e1 = n
  else
    _e1 = upto
  end
  local _upto = _e1
  while i < _upto do
    l[j + 1] = x[i + 1]
    i = i + 1
    j = j + 1
  end
  local _o = x
  local k = nil
  for k in next, _o do
    local v = _o[k]
    if not number63(k) then
      l[k] = v
    end
  end
  return(l)
end
function keys(x)
  local t = {}
  local _o1 = x
  local k = nil
  for k in next, _o1 do
    local v = _o1[k]
    if not number63(k) then
      t[k] = v
    end
  end
  return(t)
end
function edge(x)
  return(_35(x) - 1)
end
function inner(x)
  return(clip(x, 1, edge(x)))
end
function tl(l)
  return(cut(l, 1))
end
function char(s, n)
  return(clip(s, n, n + 1))
end
function code(s, n)
  local _e2
  if n then
    _e2 = n + 1
  end
  return(string.byte(s, _e2))
end
function string_literal63(x)
  return(string63(x) and char(x, 0) == "\"")
end
function id_literal63(x)
  return(string63(x) and char(x, 0) == "|")
end
function add(l, x)
  return(table.insert(l, x))
end
function drop(l)
  return(table.remove(l))
end
function last(l)
  return(l[edge(l) + 1])
end
function almost(l)
  return(cut(l, 0, edge(l)))
end
function reverse(l)
  local l1 = keys(l)
  local i = edge(l)
  while i >= 0 do
    add(l1, l[i + 1])
    i = i - 1
  end
  return(l1)
end
function reduce(f, x)
  if none63(x) then
    return(nil)
  else
    if one63(x) then
      return(hd(x))
    else
      return(f(hd(x), reduce(f, tl(x))))
    end
  end
end
function join(...)
  local ls = unstash({...})
  if two63(ls) then
    local _id = ls
    local a = _id[1]
    local b = _id[2]
    if a and b then
      local c = {}
      local o = _35(a)
      local _o2 = a
      local k = nil
      for k in next, _o2 do
        local v = _o2[k]
        c[k] = v
      end
      local _o3 = b
      local k = nil
      for k in next, _o3 do
        local v = _o3[k]
        if number63(k) then
          k = k + o
        end
        c[k] = v
      end
      return(c)
    else
      return(a or b or {})
    end
  else
    return(reduce(join, ls) or {})
  end
end
function find(f, t)
  local _o4 = t
  local _i4 = nil
  for _i4 in next, _o4 do
    local x = _o4[_i4]
    local y = f(x)
    if y then
      return(y)
    end
  end
end
function first(f, l)
  local _x2 = l
  local _n5 = _35(_x2)
  local _i5 = 0
  while _i5 < _n5 do
    local x = _x2[_i5 + 1]
    local y = f(x)
    if y then
      return(y)
    end
    _i5 = _i5 + 1
  end
end
function in63(x, t)
  return(find(function (y)
    return(x == y)
  end, t))
end
function pair(l)
  local l1 = {}
  local i = 0
  while i < _35(l) do
    add(l1, {l[i + 1], l[i + 1 + 1]})
    i = i + 1
    i = i + 1
  end
  return(l1)
end
function sort(l, f)
  table.sort(l, f)
  return(l)
end
function map(f, x)
  local t = {}
  local _x4 = x
  local _n6 = _35(_x4)
  local _i6 = 0
  while _i6 < _n6 do
    local v = _x4[_i6 + 1]
    local y = f(v)
    if is63(y) then
      add(t, y)
    end
    _i6 = _i6 + 1
  end
  local _o5 = x
  local k = nil
  for k in next, _o5 do
    local v = _o5[k]
    if not number63(k) then
      local y = f(v)
      if is63(y) then
        t[k] = y
      end
    end
  end
  return(t)
end
function keep(f, x)
  return(map(function (v)
    if f(v) then
      return(v)
    end
  end, x))
end
function keys63(t)
  local _o6 = t
  local k = nil
  for k in next, _o6 do
    local v = _o6[k]
    if not number63(k) then
      return(true)
    end
  end
  return(false)
end
function empty63(t)
  local _o7 = t
  local _i9 = nil
  for _i9 in next, _o7 do
    local x = _o7[_i9]
    return(false)
  end
  return(true)
end
function stash(args)
  if keys63(args) then
    local p = {}
    local _o8 = args
    local k = nil
    for k in next, _o8 do
      local v = _o8[k]
      if not number63(k) then
        p[k] = v
      end
    end
    p._stash = true
    add(args, p)
  end
  return(args)
end
function unstash(args)
  if none63(args) then
    return({})
  else
    local l = last(args)
    if obj63(l) and l._stash then
      local args1 = almost(args)
      local _o9 = l
      local k = nil
      for k in next, _o9 do
        local v = _o9[k]
        if not( k == "_stash") then
          args1[k] = v
        end
      end
      return(args1)
    else
      return(args)
    end
  end
end
function destash33(l, args1)
  if obj63(l) and l._stash then
    local _o10 = l
    local k = nil
    for k in next, _o10 do
      local v = _o10[k]
      if not( k == "_stash") then
        args1[k] = v
      end
    end
  else
    return(l)
  end
end
function search(s, pattern, start)
  local _e3
  if start then
    _e3 = start + 1
  end
  local _start = _e3
  local i = string.find(s, pattern, _start, true)
  return(i and i - 1)
end
function split(s, sep)
  if s == "" or sep == "" then
    return({})
  else
    local l = {}
    local n = _35(sep)
    while true do
      local i = search(s, sep)
      if nil63(i) then
        break
      else
        add(l, clip(s, 0, i))
        s = clip(s, i + n)
      end
    end
    add(l, s)
    return(l)
  end
end
function cat(...)
  local xs = unstash({...})
  return(reduce(function (a, b)
    return(a .. b)
  end, xs) or "")
end
function _43(...)
  local xs = unstash({...})
  return(reduce(function (a, b)
    return(a + b)
  end, xs) or 0)
end
function _(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a - b)
  end, reverse(xs)) or 0)
end
function _42(...)
  local xs = unstash({...})
  return(reduce(function (a, b)
    return(a * b)
  end, xs) or 1)
end
function _47(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a / b)
  end, reverse(xs)) or 1)
end
function _37(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a % b)
  end, reverse(xs)) or 0)
end
function _62(a, b)
  return(a > b)
end
function _60(a, b)
  return(a < b)
end
function _61(a, b)
  return(a == b)
end
function _6261(a, b)
  return(a >= b)
end
function _6061(a, b)
  return(a <= b)
end
function number(s)
  return(tonumber(s))
end
function number_code63(n)
  return(n > 47 and n < 58)
end
function numeric63(s)
  local n = _35(s)
  local i = 0
  while i < n do
    if not number_code63(code(s, i)) then
      return(false)
    end
    i = i + 1
  end
  return(true)
end
function escape(s)
  local s1 = "\""
  local i = 0
  while i < _35(s) do
    local c = char(s, i)
    local _e4
    if c == "\n" then
      _e4 = "\\n"
    else
      local _e5
      if c == "\"" then
        _e5 = "\\\""
      else
        local _e6
        if c == "\\" then
          _e6 = "\\\\"
        else
          _e6 = c
        end
        _e5 = _e6
      end
      _e4 = _e5
    end
    local c1 = _e4
    s1 = s1 .. c1
    i = i + 1
  end
  return(s1 .. "\"")
end
function str(x, stack)
  if nil63(x) then
    return("nil")
  else
    if nan63(x) then
      return("nan")
    else
      if x == inf then
        return("inf")
      else
        if x == -inf then
          return("-inf")
        else
          if boolean63(x) then
            if x then
              return("true")
            else
              return("false")
            end
          else
            if string63(x) then
              return(escape(x))
            else
              if atom63(x) then
                return(tostring(x))
              else
                if function63(x) then
                  return("function")
                else
                  if stack and in63(x, stack) then
                    return("circular")
                  else
                    if not( type(x) == "table") then
                      return(escape(tostring(x)))
                    else
                      local s = "("
                      local sp = ""
                      local xs = {}
                      local ks = {}
                      local l = stack or {}
                      add(l, x)
                      local _o11 = x
                      local k = nil
                      for k in next, _o11 do
                        local v = _o11[k]
                        if number63(k) then
                          xs[k] = str(v, l)
                        else
                          add(ks, k .. ":")
                          add(ks, str(v, l))
                        end
                      end
                      drop(l)
                      local _o12 = join(xs, ks)
                      local _i14 = nil
                      for _i14 in next, _o12 do
                        local v = _o12[_i14]
                        s = s .. sp .. v
                        sp = " "
                      end
                      return(s .. ")")
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
local values = unpack or table.unpack
function apply(f, args)
  local _args = stash(args)
  return(f(values(_args)))
end
function call(f)
  return(f())
end
function toplevel63()
  return(one63(environment))
end
function setenv(k, ...)
  local _r67 = unstash({...})
  local _k = destash33(k, _r67)
  local _id1 = _r67
  local _keys = cut(_id1, 0)
  if string63(_k) then
    local _e7
    if _keys.toplevel then
      _e7 = hd(environment)
    else
      _e7 = last(environment)
    end
    local frame = _e7
    local entry = frame[_k] or {}
    local _o13 = _keys
    local _k1 = nil
    for _k1 in next, _o13 do
      local v = _o13[_k1]
      entry[_k1] = v
    end
    frame[_k] = entry
    return(frame[_k])
  end
end
local math = math
abs = math.abs
acos = math.acos
asin = math.asin
atan = math.atan
atan2 = math.atan2
ceil = math.ceil
cos = math.cos
floor = math.floor
log = math.log
log10 = math.log10
max = math.max
min = math.min
pow = math.pow
random = math.random
sin = math.sin
sinh = math.sinh
sqrt = math.sqrt
tan = math.tan
tanh = math.tanh
setenv("quote", {_stash = true, macro = function (form)
  return(quoted(form))
end})
setenv("quasiquote", {_stash = true, macro = function (form)
  return(quasiexpand(form, 1))
end})
setenv("at", {_stash = true, macro = function (l, i)
  if target == "lua" and number63(i) then
    i = i + 1
  else
    if target == "lua" then
      i = {"+", i, 1}
    end
  end
  return({"get", l, i})
end})
setenv("wipe", {_stash = true, macro = function (place)
  if target == "lua" then
    return({"set", place, "nil"})
  else
    return({"%delete", place})
  end
end})
setenv("list", {_stash = true, macro = function (...)
  local body = unstash({...})
  local x = unique("x")
  local l = {}
  local forms = {}
  local _o1 = body
  local k = nil
  for k in next, _o1 do
    local v = _o1[k]
    if number63(k) then
      l[k] = v
    else
      add(forms, {"set", {"get", x, {"quote", k}}, v})
    end
  end
  if some63(forms) then
    return(join({"let", x, join({"%array"}, l)}, forms, {x}))
  else
    return(join({"%array"}, l))
  end
end})
setenv("if", {_stash = true, macro = function (...)
  local branches = unstash({...})
  return(hd(expand_if(branches)))
end})
setenv("case", {_stash = true, macro = function (x, ...)
  local _r10 = unstash({...})
  local _x35 = destash33(x, _r10)
  local _id2 = _r10
  local clauses = cut(_id2, 0)
  local bs = map(function (_x36)
    local _id3 = _x36
    local a = _id3[1]
    local b = _id3[2]
    if nil63(b) then
      return({a})
    else
      return({{"=", {"quote", a}, _x35}, b})
    end
  end, pair(clauses))
  return(join({"if"}, apply(join, bs)))
end})
setenv("when", {_stash = true, macro = function (cond, ...)
  local _r13 = unstash({...})
  local _cond1 = destash33(cond, _r13)
  local _id5 = _r13
  local body = cut(_id5, 0)
  return({"if", _cond1, join({"do"}, body)})
end})
setenv("unless", {_stash = true, macro = function (cond, ...)
  local _r15 = unstash({...})
  local _cond3 = destash33(cond, _r15)
  local _id7 = _r15
  local body = cut(_id7, 0)
  return({"if", {"not", _cond3}, join({"do"}, body)})
end})
setenv("obj", {_stash = true, macro = function (...)
  local body = unstash({...})
  return(join({"%object"}, mapo(function (x)
    return(x)
  end, body)))
end})
setenv("let", {_stash = true, macro = function (bs, ...)
  local _r19 = unstash({...})
  local _bs1 = destash33(bs, _r19)
  local _id11 = _r19
  local body = cut(_id11, 0)
  if atom63(_bs1) then
    return(join({"let", {_bs1, hd(body)}}, tl(body)))
  else
    if none63(_bs1) then
      return(join({"do"}, body))
    else
      local _id12 = _bs1
      local lh = _id12[1]
      local rh = _id12[2]
      local bs2 = cut(_id12, 2)
      local _id13 = bind(lh, rh)
      local id = _id13[1]
      local val = _id13[2]
      local bs1 = cut(_id13, 2)
      local renames = {}
      if bound63(id) or toplevel63() then
        local id1 = unique(id)
        renames = {id, id1}
        id = id1
      else
        setenv(id, {_stash = true, variable = true})
      end
      return({"do", {"%local", id, val}, {"let-symbol", renames, join({"let", join(bs1, bs2)}, body)}})
    end
  end
end})
setenv("with", {_stash = true, macro = function (x, v, ...)
  local _r21 = unstash({...})
  local _x84 = destash33(x, _r21)
  local _v1 = destash33(v, _r21)
  local _id15 = _r21
  local body = cut(_id15, 0)
  return(join({"let", {_x84, _v1}}, body, {_x84}))
end})
setenv("let-when", {_stash = true, macro = function (x, v, ...)
  local _r23 = unstash({...})
  local _x95 = destash33(x, _r23)
  local _v3 = destash33(v, _r23)
  local _id17 = _r23
  local body = cut(_id17, 0)
  local y = unique("y")
  return({"let", y, _v3, {"when", y, join({"let", {_x95, y}}, body)}})
end})
setenv("define-macro", {_stash = true, macro = function (name, args, ...)
  local _r25 = unstash({...})
  local _name1 = destash33(name, _r25)
  local _args1 = destash33(args, _r25)
  local _id19 = _r25
  local body = cut(_id19, 0)
  local _x105 = {"setenv", {"quote", _name1}}
  _x105.macro = join({"fn", _args1}, body)
  local form = _x105
  eval(form)
  return(form)
end})
setenv("define-special", {_stash = true, macro = function (name, args, ...)
  local _r27 = unstash({...})
  local _name3 = destash33(name, _r27)
  local _args3 = destash33(args, _r27)
  local _id21 = _r27
  local body = cut(_id21, 0)
  local _x113 = {"setenv", {"quote", _name3}}
  _x113.special = join({"fn", _args3}, body)
  local form = join(_x113, keys(body))
  eval(form)
  return(form)
end})
setenv("define-symbol", {_stash = true, macro = function (name, expansion)
  setenv(name, {_stash = true, symbol = expansion})
  local _x119 = {"setenv", {"quote", name}}
  _x119.symbol = {"quote", expansion}
  return(_x119)
end})
setenv("define-reader", {_stash = true, macro = function (_x128, ...)
  local _id24 = _x128
  local char = _id24[1]
  local s = _id24[2]
  local _r31 = unstash({...})
  local __x128 = destash33(_x128, _r31)
  local _id25 = _r31
  local body = cut(_id25, 0)
  return({"set", {"get", "read-table", char}, join({"fn", {s}}, body)})
end})
setenv("define", {_stash = true, macro = function (name, x, ...)
  local _r33 = unstash({...})
  local _name5 = destash33(name, _r33)
  local _x139 = destash33(x, _r33)
  local _id27 = _r33
  local body = cut(_id27, 0)
  setenv(_name5, {_stash = true, variable = true})
  if some63(body) then
    return(join({"%local-function", _name5}, bind42(_x139, body)))
  else
    return({"%local", _name5, _x139})
  end
end})
setenv("define-global", {_stash = true, macro = function (name, x, ...)
  local _r35 = unstash({...})
  local _name7 = destash33(name, _r35)
  local _x147 = destash33(x, _r35)
  local _id29 = _r35
  local body = cut(_id29, 0)
  setenv(_name7, {_stash = true, variable = true, toplevel = true})
  if some63(body) then
    return(join({"%global-function", _name7}, bind42(_x147, body)))
  else
    return({"set", _name7, _x147})
  end
end})
setenv("with-frame", {_stash = true, macro = function (...)
  local body = unstash({...})
  local x = unique("x")
  return({"do", {"add", "environment", {"obj"}}, {"with", x, join({"do"}, body), {"drop", "environment"}}})
end})
setenv("with-bindings", {_stash = true, macro = function (_x169, ...)
  local _id32 = _x169
  local names = _id32[1]
  local _r37 = unstash({...})
  local __x169 = destash33(_x169, _r37)
  local _id33 = _r37
  local body = cut(_id33, 0)
  local x = unique("x")
  local _x173 = {"setenv", x}
  _x173.variable = true
  return(join({"with-frame", {"each", x, names, _x173}}, body))
end})
setenv("let-macro", {_stash = true, macro = function (definitions, ...)
  local _r40 = unstash({...})
  local _definitions1 = destash33(definitions, _r40)
  local _id35 = _r40
  local body = cut(_id35, 0)
  add(environment, {})
  map(function (m)
    return(macroexpand(join({"define-macro"}, m)))
  end, _definitions1)
  local _x179 = join({"do"}, macroexpand(body))
  drop(environment)
  return(_x179)
end})
setenv("let-symbol", {_stash = true, macro = function (expansions, ...)
  local _r44 = unstash({...})
  local _expansions1 = destash33(expansions, _r44)
  local _id38 = _r44
  local body = cut(_id38, 0)
  add(environment, {})
  map(function (_x189)
    local _id39 = _x189
    local name = _id39[1]
    local exp = _id39[2]
    return(macroexpand({"define-symbol", name, exp}))
  end, pair(_expansions1))
  local _x188 = join({"do"}, macroexpand(body))
  drop(environment)
  return(_x188)
end})
setenv("let-unique", {_stash = true, macro = function (names, ...)
  local _r48 = unstash({...})
  local _names1 = destash33(names, _r48)
  local _id41 = _r48
  local body = cut(_id41, 0)
  local bs = map(function (n)
    return({n, {"unique", {"quote", n}}})
  end, _names1)
  return(join({"let", apply(join, bs)}, body))
end})
setenv("fn", {_stash = true, macro = function (args, ...)
  local _r51 = unstash({...})
  local _args5 = destash33(args, _r51)
  local _id43 = _r51
  local body = cut(_id43, 0)
  return(join({"%function"}, bind42(_args5, body)))
end})
setenv("guard", {_stash = true, macro = function (expr)
  if target == "js" then
    return({{"fn", join(), {"%try", {"list", true, expr}}}})
  else
    local x = unique("x")
    local msg = unique("msg")
    local trace = unique("trace")
    return({"let", {x, "nil", msg, "nil", trace, "nil"}, {"if", {"xpcall", {"fn", join(), {"set", x, expr}}, {"fn", {"m"}, {"set", msg, {"clip", "m", {"+", {"search", "m", "\": \""}, 2}}}, {"set", trace, {{"get", "debug", {"quote", "traceback"}}}}}}, {"list", true, x}, {"list", false, msg, trace}}})
  end
end})
setenv("each", {_stash = true, macro = function (x, t, ...)
  local _r55 = unstash({...})
  local _x266 = destash33(x, _r55)
  local _t1 = destash33(t, _r55)
  local _id46 = _r55
  local body = cut(_id46, 0)
  local o = unique("o")
  local n = unique("n")
  local i = unique("i")
  local _e3
  if atom63(_x266) then
    _e3 = {i, _x266}
  else
    local _e4
    if _35(_x266) > 1 then
      _e4 = _x266
    else
      _e4 = {i, hd(_x266)}
    end
    _e3 = _e4
  end
  local _id47 = _e3
  local k = _id47[1]
  local v = _id47[2]
  local _e5
  if target == "lua" then
    _e5 = body
  else
    _e5 = {join({"let", k, {"if", {"numeric?", k}, {"parseInt", k}, k}}, body)}
  end
  return({"let", {o, _t1, k, "nil"}, {"%for", o, k, join({"let", {v, {"get", o, k}}}, _e5)}})
end})
setenv("for", {_stash = true, macro = function (i, to, ...)
  local _r57 = unstash({...})
  local _i3 = destash33(i, _r57)
  local _to1 = destash33(to, _r57)
  local _id49 = _r57
  local body = cut(_id49, 0)
  return({"let", _i3, 0, join({"while", {"<", _i3, _to1}}, body, {{"inc", _i3}})})
end})
setenv("step", {_stash = true, macro = function (v, t, ...)
  local _r59 = unstash({...})
  local _v5 = destash33(v, _r59)
  local _t3 = destash33(t, _r59)
  local _id51 = _r59
  local body = cut(_id51, 0)
  local x = unique("x")
  local n = unique("n")
  local i = unique("i")
  return({"let", {x, _t3, n, {"#", x}}, {"for", i, n, join({"let", {_v5, {"at", x, i}}}, body)}})
end})
setenv("set-of", {_stash = true, macro = function (...)
  local xs = unstash({...})
  local l = {}
  local _o3 = xs
  local _i5 = nil
  for _i5 in next, _o3 do
    local x = _o3[_i5]
    l[x] = true
  end
  return(join({"obj"}, l))
end})
setenv("language", {_stash = true, macro = function ()
  return({"quote", target})
end})
setenv("target", {_stash = true, macro = function (...)
  local clauses = unstash({...})
  return(clauses[target])
end})
setenv("join!", {_stash = true, macro = function (a, ...)
  local _r63 = unstash({...})
  local _a1 = destash33(a, _r63)
  local _id53 = _r63
  local bs = cut(_id53, 0)
  return({"set", _a1, join({"join", _a1}, bs)})
end})
setenv("cat!", {_stash = true, macro = function (a, ...)
  local _r65 = unstash({...})
  local _a3 = destash33(a, _r65)
  local _id55 = _r65
  local bs = cut(_id55, 0)
  return({"set", _a3, join({"cat", _a3}, bs)})
end})
setenv("inc", {_stash = true, macro = function (n, by)
  return({"set", n, {"+", n, by or 1}})
end})
setenv("dec", {_stash = true, macro = function (n, by)
  return({"set", n, {"-", n, by or 1}})
end})
setenv("with-indent", {_stash = true, macro = function (form)
  local x = unique("x")
  return({"do", {"inc", "indent-level"}, {"with", x, form, {"dec", "indent-level"}}})
end})
setenv("export", {_stash = true, macro = function (...)
  local names = unstash({...})
  if target == "js" then
    return(join({"do"}, map(function (k)
      return({"set", {"get", "exports", {"quote", k}}, k})
    end, names)))
  else
    local x = {}
    local _o5 = names
    local _i7 = nil
    for _i7 in next, _o5 do
      local k = _o5[_i7]
      x[k] = k
    end
    return({"return", join({"obj"}, x)})
  end
end})
local reader = require("reader")
local compiler = require("compiler")
local system = require("system")
local function eval_print(form)
  local _x = nil
  local _msg = nil
  local _trace = nil
  local _e
  if xpcall(function ()
    _x = compiler.eval(form)
    return(_x)
  end, function (m)
    _msg = clip(m, search(m, ": ") + 2)
    _trace = debug.traceback()
    return(_trace)
  end) then
    _e = {true, _x}
  else
    _e = {false, _msg, _trace}
  end
  local _id = _e
  local ok = _id[1]
  local x = _id[2]
  local trace = _id[3]
  if not ok then
    return(print("error: " .. x .. "\n" .. trace))
  else
    if is63(x) then
      return(print(str(x)))
    end
  end
end
local function rep(s)
  return(eval_print(reader["read-string"](s)))
end
local function repl()
  local buf = ""
  local function rep1(s)
    buf = buf .. s
    local more = {}
    local form = reader["read-string"](buf, more)
    if not( form == more) then
      eval_print(form)
      buf = ""
      return(system.write("> "))
    end
  end
  system.write("> ")
  while true do
    local s = io.read()
    if s then
      rep1(s .. "\n")
    else
      break
    end
  end
end
function compile_file(path)
  local s = reader.stream(system["read-file"](path))
  local body = reader["read-all"](s)
  local form = compiler.expand(join({"do"}, body))
  return(compiler.compile(form, {_stash = true, stmt = true}))
end
function load(path)
  return(compiler.run(compile_file(path)))
end
local function run_file(path)
  return(compiler.run(system["read-file"](path)))
end
local function usage()
  print("usage: lumen [options] <object files>")
  print("options:")
  print("  -c <input>\tCompile input file")
  print("  -o <output>\tOutput file")
  print("  -t <target>\tTarget language (default: lua)")
  print("  -e <expr>\tExpression to evaluate")
  return(system.exit())
end
local function main()
  local arg = hd(system.argv)
  if arg == "-h" or arg == "--help" then
    usage()
  end
  local pre = {}
  local input = nil
  local output = nil
  local target1 = nil
  local expr = nil
  local argv = system.argv
  local n = _35(argv)
  local i = 0
  while i < n do
    local a = argv[i + 1]
    if a == "-c" or a == "-o" or a == "-t" or a == "-e" then
      if i == n - 1 then
        print("missing argument for " .. a)
      else
        i = i + 1
        local val = argv[i + 1]
        if a == "-c" then
          input = val
        else
          if a == "-o" then
            output = val
          else
            if a == "-t" then
              target1 = val
            else
              if a == "-e" then
                expr = val
              end
            end
          end
        end
      end
    else
      if not( "-" == char(a, 0)) then
        add(pre, a)
      end
    end
    i = i + 1
  end
  local _x4 = pre
  local _n = _35(_x4)
  local _i = 0
  while _i < _n do
    local file = _x4[_i + 1]
    run_file(file)
    _i = _i + 1
  end
  if nil63(input) then
    if expr then
      return(rep(expr))
    else
      return(repl())
    end
  else
    if target1 then
      target = target1
    end
    local code = compile_file(input)
    if nil63(output) or output == "-" then
      return(print(code))
    else
      return(system["write-file"](output, code))
    end
  end
end
main()
