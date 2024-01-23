def dtb(n, count = 2):
    """decimal -> binary"""
    if n == 0 and count <= 0:
        return ""
    elif n == 0:
        return dtb(n, count-1) + "0"
    return dtb(n // 2, count-1) + str(n % 2)

def bth(n):
    """binary -> hex"""
    num = int(n, 2)
    hnum = hex(num)
    if len(hnum[2:]) < 2:
        hnum = hnum[:2] + "0" + hnum[2:]
    return(hnum[2:])
    
def ADD(Rd, Rn, Rm):
    string = "0"
    string += dtb(int(Rn)) + dtb(int(Rm)) + dtb(int(Rd)) + "0"
    outstr = bth(string)
    return outstr
    
def SUB(Rd, Rn, Rm):
    string = "1"
    string += dtb(int(Rn)) + dtb(int(Rm)) + dtb(int(Rd)) + "0"
    outstr = bth(string)
    return outstr


def assemble(file):
    outstr = "v3.0 hex words addressed"
    adr = bth(dtb(0))
    adrnum = 0
    count = 0
    f = open(file, "r")
    for line in f:
        if count == 16:
            count = 0
            adrnum += 16
            adr = bth(dtb(adrnum))
        if line[:3] == "ADD":
            if count == 0:
                outstr += "\n" + adr + ": "
            outstr += str(ADD(line[5], line[9], line[13])) + " "
            count += 1
        elif line[:3] == "SUB":
            if count == 0:
                outstr += "\n" + adr + ": "
            outstr += str(SUB(line[5], line[9], line[13])) + " "
            count += 1
    f.close()
                
    f2 = open("image.txt", "w")
    f2.write(outstr)
    f2.close()

    f2 = open("image.txt", "r")
    print(f2.read())

    
    
def main():
    assemble("instructions.txt")

if __name__ == "__main__":
    main()

