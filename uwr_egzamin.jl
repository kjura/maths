using Revise




function f(x) 

    return x^(1/4) - ((x + 114) / 65)

end


function dfdx(x)

    return (1 / (4 * ((x^3)^(1/4)))) - (1/65)

end