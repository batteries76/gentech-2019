# x = 7
# y = 4
# z = 3

# def multiply(n1, n2, n3)
#     return n1 * n2 * n3
# end

# multiply(x, 7, 8)

# @x = 5

def area_of_rect(l, w)
    return l * w
end

def volume_of_rect_prism(area, height)
    return area * height
end

def volume_prism(len, wid, ht)
    area = area_of_rect(len, wid)
    vol = volume_of_rect_prism(area, ht)
    return vol
end

result_vol = volume_prism(3, 2, 5)
puts(result_vol)