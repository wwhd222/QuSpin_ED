# magnetization 
def n_basis(int L, int Nup, npy_intp Ns, basis_type[:] pars,basis_type[:] basis):
    cdef basis_type s
    cdef int j
    cdef npy_intp MAX = comb(L,Nup,exact=True) - 1
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )

    make_n_basis_template[basis_type](next_state_pcon_hcp,pars,MAX,s,basis)

# parity 
def n_p_basis(int L,int Nup,int pblock,basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )

    return make_p_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,pblock,&N[0],basis)


def p_basis(int L,int pblock,basis_type[:] pars,N_type[:] N, basis_type[:] basis):
    cdef basis_type s = 0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)

    return make_p_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,pblock,&N[0],basis)


# parity-spin inversion
def n_p_z_basis(int L, int Nup, int pblock, int zblock,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )

    return make_p_z_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,pblock,zblock,&N[0],basis)
    

def p_z_basis(int L, int pblock, int zblock,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)

    return make_p_z_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,pblock,zblock,&N[0],basis)


# (parity)*(spin inversion)
def n_pz_basis(int L, int Nup, int pzblock,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_pz_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,pzblock,&N[0],basis)
    

def pz_basis(int L, int pzblock,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)


    return make_pz_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,pzblock,&N[0],basis)


# translation
def n_t_basis(int L, int Nup, int kblock,int a,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,kblock,a,&N[0],basis)


def t_basis(int L, int kblock,int a,basis_type[:] pars, N_type[:] N, basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)

    return make_t_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,kblock,a,&N[0],basis)


# translation-parity
def n_t_p_basis(int L, int Nup,int pblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    s = 0
    for j in range(Nup):
        s += ( 1ull << j )
    return make_t_p_basis_template[basis_type,N_type,M1_type](next_state_pcon_hcp,pars,MAX,s,L,pblock,kblock,a,&N[0],&M[0],basis)


def t_p_basis(int L,int pblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_p_basis_template[basis_type,N_type,M1_type](next_state_inc_1,pars,MAX,s,L,pblock,kblock,a,&N[0],&M[0],basis)




# translation-parity-spin inversion
def n_t_p_z_basis(int L, int Nup,int pblock,int zblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M2_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_p_z_basis_template[basis_type,N_type,M2_type](next_state_pcon_hcp,pars,MAX,s,L,pblock,zblock,kblock,a,&N[0],&M[0],basis)
    

def t_p_z_basis(int L,int pblock,int zblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M2_type[:] M,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_p_z_basis_template[basis_type,N_type,M2_type](next_state_inc_1,pars,MAX,s,L,pblock,zblock,kblock,a,&N[0],&M[0],basis)




# translation-(parity)*(spin inversion)
def n_t_pz_basis(int L, int Nup,int pzblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_pz_basis_template[basis_type,N_type,M1_type](next_state_pcon_hcp,pars,MAX,s,L,pzblock,kblock,a,&N[0],&M[0],basis)
    

def t_pz_basis(int L,int pzblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s = 0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_pz_basis_template[basis_type,N_type,M1_type](next_state_inc_1,pars,MAX,s,L,pzblock,kblock,a,&N[0],&M[0],basis)


# translation-spin inversion
def n_t_z_basis(int L,int Nup,int zblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_z_basis_template[basis_type,N_type,M1_type](next_state_pcon_hcp,pars,MAX,s,L,zblock,kblock,a,&N[0],&M[0],basis)


def t_z_basis(int L,int zblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s = 0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_z_basis_template[basis_type,N_type,M1_type](next_state_inc_1,pars,MAX,s,L,zblock,kblock,a,&N[0],&M[0],basis)




# translation-spin inversion A
def n_t_zA_basis(int L, int Nup,int zAblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_zA_basis_template[basis_type,N_type,M1_type](next_state_pcon_hcp,pars,MAX,s,L,zAblock,kblock,a,&N[0],&M[0],basis)


def t_zA_basis(int L,int zAblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_zA_basis_template[basis_type,N_type,M1_type](next_state_inc_1,pars,MAX,s,L,zAblock,kblock,a,&N[0],&M[0],basis)



# translation-spin inversion B
def n_t_zB_basis(int L, int Nup,int zBblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_zB_basis_template[basis_type,N_type,M1_type](next_state_pcon_hcp,pars,MAX,s,L,zBblock,kblock,a,&N[0],&M[0],basis)
    

def t_zB_basis(int L,int zBblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M1_type[:] M,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_zB_basis_template[basis_type,N_type,M1_type](next_state_inc_1,pars,MAX,s,L,zBblock,kblock,a,&N[0],&M[0],basis)




# translation-spin inversion A-spin inversion B
def n_t_zA_zB_basis(int L,int Nup,int zAblock,int zBblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M2_type[:] M,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1

    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_t_zA_zB_basis_template[basis_type,N_type,M2_type](next_state_pcon_hcp,pars,MAX,s,L,zAblock,zBblock,kblock,a,&N[0],&M[0],basis)

def t_zA_zB_basis(int L,int zAblock,int zBblock,int kblock,int a,basis_type[:] pars,N_type[:] N,M2_type[:] M,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_t_zA_zB_basis_template[basis_type,N_type,M2_type](next_state_inc_1,pars,MAX,s,L,zAblock,zBblock,kblock,a,&N[0],&M[0],basis)





# spin inversion
def n_z_basis(int L,int Nup, int zblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_z_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,zblock,&N[0],basis)


def z_basis(int L, int zblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_z_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,zblock,&N[0],basis)




# spin inversion A
def n_zA_basis(int L,int Nup, int zAblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_zA_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,zAblock,&N[0],basis)


def zA_basis(int L, int zAblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX = (one<<L)
    return make_zA_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,zAblock,&N[0],basis)




# spin inversion B
def n_zB_basis(int L,int Nup, int zBblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_zB_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,zBblock,&N[0],basis)

    

def zB_basis(int L, int zBblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_zB_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,zBblock,&N[0],basis)



# spin inversion A-spin inversion B
def n_zA_zB_basis(int L,int Nup, int zAblock, int zBblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s
    cdef npy_intp MAX=comb(L,Nup,exact=True)
    cdef int j
    cdef object one = 1
    s = 0
    for j in range(Nup):
        s += ( one << j )
    return make_zA_zB_basis_template[basis_type,N_type](next_state_pcon_hcp,pars,MAX,s,L,zAblock,zBblock,&N[0],basis)
    

def zA_zB_basis(int L, int zAblock, int zBblock, basis_type[:] pars,N_type[:] N,basis_type[:] basis):
    cdef basis_type s=0
    cdef object one = 1
    cdef npy_intp MAX=(one<<L)
    return make_zA_zB_basis_template[basis_type,N_type](next_state_inc_1,pars,MAX,s,L,zAblock,zBblock,&N[0],basis)

    
