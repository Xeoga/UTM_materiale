

encode_str = "ebn.fyf0{dy5vhujwll/}5{hn5wl5lr5wlvl.fyf"
decode_str = ""
shift = 3
for leter in encode_str:
    #print(chr(ord(leter)-shift),end="") # in cazul dat poate sa fii si +
    decode_str+=chr(ord(leter)-shift)
print(decode_str)