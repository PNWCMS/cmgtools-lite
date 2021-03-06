      double precision function lumin(x1,x2,fpflag,lum,iset)
      implicit none

      include 'parameters.f'
      include 'pdfcontrol.f'

      double precision x1,x2,fpflag,lum

      double complex Ngz2
      COMMON/gzint/ Ngz2
      SAVE /gzint/

      double precision tlum
      double precision asyl
      double complex asgz

      double precision gvusq,gvdsq,gvugvd

      double precision dv1,dv2,ds1,ds2,uv1,uv2,us1,us2,sv1,sv2,ss1,ss2
c!      DOUBLE PRECISION str1,str2

      INTEGER iset

      tlum = 0d0

CCC   only gvu,gvd,gvl,Ngz2 are complex
CCC   we only need to concern about Nzz*|gvu|^2, Nzz*|gvd|^2, Nzz*|gvu*conjg(gvd)|=Nzz*|gvd*conjg(gvu)|
CCC   i.e. replace all gvusq with gvusq, gvdsq with gvdsq, gvugvd with gvugvd
CCC   others will become real via assigning the complex number to a variable of double precision type
      gvusq = dble(gvu*conjg(gvu))
      gvdsq = dble(gvd*conjg(gvd))
      gvugvd = dble(gvu*conjg(gvd))

CCC   Call the PDFs

      CALL getPDFs(x1,x2,muf,iset)
      
CCC   Define the up/down distributions for pp and ppbar colliders
CCC   1 is always the proton
CCC   variable ?v? such as uv1 means quark, variable ?s? such as us1 means anti-quark 

      if (ptype.eq.1) then
         dv1 = dval1+dsea1
         dv2 = dval2+dsea2
         ds1 = dsea1
         ds2 = dsea2
         uv1 = uval1+usea1
         uv2 = uval2+usea2
         us1 = usea1
         us2 = usea2
         sv1 = sval1+ssea1
         sv2 = sval2+ssea2
         ss1 = ssea1
         ss2 = ssea2
      else!if (ptype.eq.2) then      
         if (fpflag.lt.(0.0d0)) then
            dv1 = dval1+dsea1
            dv2 = dsea2
            ds1 = dsea1
            ds2 = dval2+dsea2
            uv1 = uval1+usea1
            uv2 = usea2
            us1 = usea1
            us2 = uval2+usea2
            sv1 = sval1+ssea1
            sv2 = ssea2
            ss1 = ssea1
            ss2 = sval2+ssea2
         else
            dv1 = dsea1
            dv2 = dval2+dsea2
            ds1 = dval1+dsea1
            ds2 = dsea2
            uv1 = usea1
            uv2 = uval2+usea2
            us1 = uval1+usea1
            us2 = usea2
            sv1 = ssea1
            sv2 = sval2+ssea2
            ss1 = sval1+ssea1
            ss2 = ssea2
         endif 
      endif

CCC   For now, assume no "valence" strange, override above

c!      str1 = ssea1
c!      str2 = ssea2

CCC   Ignore the override

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
CCCCCCCCCCCCCCCCC  G+Z luminosity  CCCCCCCCCCCCCCCCCCCCCCCCCC
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      if ((ptype.eq.1).or.(ptype.eq.2)) then

CCC   All channels of the form qiqj,qbariqbarj,qiqbarj
CCC   Add in the quark couplings to vector bosons here

CCC   These are the v^2+a^2 pieces, not the axial pieces

CCC   All channels of the form uiuj+ubariubarj+didj+dbaridbarj, i<>j
         if (lum.eq.(1.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *(uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)
c!     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*(dv1*str2
c!     &           +str1*dv2+dv1*btm2+btm1*dv2+2.0d0*(str1*btm2+btm1*str2)
c!     &           +ds1*str2+str1*ds2+ds1*btm2+btm1*ds2))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *(uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)
     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*(dv1*sv2
     &           +sv1*dv2+dv1*btm2+btm1*dv2+sv1*btm2+btm1*sv2
     &           +ds1*ss2+ss1*ds2+ds1*btm2+btm1*ds2+ss1*btm2+btm1*ss2))
CCC   All channels of the form qiqi, qbariqbari
c!         elseif (lum.eq.(2.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *(uv1*uv2+us1*us2+2.0d0*chm1*chm2)+
c!     &           (Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
c!     &           *(dv1*dv2+ds1*ds2+2.0d0*(str1*str2+btm1*btm2)))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *(uv1*uv2+us1*us2+2.0d0*chm1*chm2)+
     &           (Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
     &           *(dv1*dv2+ds1*ds2+sv1*sv2+ss1*ss2+2.0d0*btm1*btm2))
CCC   The gg channel
         elseif (lum.eq.(4.0d0)) then
            tlum = glu1*glu2*(Ngg*(2.0d0*Qu**2+3.0d0*Qd**2)
     &           +Nzz*(2.0d0*(gvusq+gau**2)+3.0d0*(gvdsq+gad**2))
     &           +Ngz2*(2.0d0*gvu*Qu+3.0d0*gvd*Qd))
CCC   The qqb channel
         elseif (lum.eq.(3.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)
c!     &           +Ngz2*Qu*gvu)*(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
c!     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
c!     &           *(dv1*ds2+ds1*dv2+2.0d0*(str1*str2+btm1*btm2)))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)
     &           +Ngz2*Qu*gvu)*(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
     &           *(dv1*ds2+ds1*dv2+sv1*ss2+ss1*sv2+2.0d0*btm1*btm2))
CCC   The qg channel, with the quark getting x1
CCC   Unlike for W case, we actually get inital up, anti-down
         elseif (lum.eq.(5.0d0)) then
c!            tlum = glu2*((Ngg*Qd**2+Nzz*(gvdsq+gad**2)
c!     &           +Ngz2*Qd*gvd)*(dv1+ds1+2.0d0*(str1+btm1))
c!     &           +(Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *(uv1+us1+2.0d0*chm1))
            tlum = glu2*((Ngg*Qd**2+Nzz*(gvdsq+gad**2)
     &           +Ngz2*Qd*gvd)*(dv1+ds1+sv1+ss1+2.0d0*btm1)
     &           +(Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *(uv1+us1+2.0d0*chm1))
CCC   The uiubarj+didbarj channel
         elseif (lum.eq.(11.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *(uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
c!     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*
c!     &           (dv1*str2+dv1*btm2+2.0d0*(str1*btm2+btm1*str2)
c!     &           +ds1*str2+ds1*btm2+str1*ds2+str1*dv2+btm1*ds2
c!     &           +btm1*dv2))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *(uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*
     &           (dv1*ss2+dv1*btm2+ss1*dv2+btm1*dv2
     &           +sv1*ds2+sv1*btm2+ds1*sv2+btm1*sv2
     &           +ds1*btm2+btm1*ds2+ss1*btm2+btm1*ss2))
CCC   ui*dj+ubari*dbarj+di*uj+dbari*ubarj+ui*dbarj+ubari*dj+di*ubarj+dbari*uj
         elseif (lum.eq.(13.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *((uv1+chm1)*(dv2+str2+btm2)+(us1+chm1)*(ds2+str2+btm2)
c!     &           +(uv1+chm1)*(ds2+str2+btm2)+(us1+chm1)*(dv2+str2+btm2))
c!     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*
c!     &           ((dv1+str1+btm1)*(uv2+chm2)+(ds1+str1+btm1)*(us2+chm2)
c!     &           +(dv1+str1+btm1)*(us2+chm2)+(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *((uv1+chm1)*(dv2+sv2+btm2)+(us1+chm1)*(ds2+ss2+btm2)
     &           +(uv1+chm1)*(ds2+ss2+btm2)+(us1+chm1)*(dv2+sv2+btm2))
     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)*
     &           ((dv1+sv1+btm1)*(uv2+chm2)+(ds1+ss1+btm1)*(us2+chm2)
     &           +(dv1+sv1+btm1)*(us2+chm2)+(ds1+ss1+btm1)
     &           *(uv2+chm2)))
            
CCC   CD vi*vj piece, for uiuj+didj+ubariubarj+didj+dbaridbarj
CCC   +uiubarj+didbarj, i<>j
CCC   +ui*dj+ubari*dbarj+di*uj+dbari*ubarj+ui*dbarj+ubari*dj+di*ubarj+dbari*uj
CCC   +ui*ubari+di*dbari
CCC   +ui*ui+di*di+ubari*ubari+dbari*dbari
         elseif (lum.eq.(15.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*gvusq+Ngz2*Qu*gvu)
c!     &           *((uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)
c!     &           -(uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
c!     &           -(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
c!     &           +(uv1*uv2+us1*us2+2.0d0*chm1*chm2))
c!     &           +(Ngg*Qd**2+Nzz*gvdsq+Ngz2*Qd*gvd)*((dv1*str2
c!     &           +str1*dv2+dv1*btm2+btm1*dv2+2.0d0*(str1*btm2
c!     &           +btm1*str2)+ds1*str2+str1*ds2+ds1*btm2+btm1*ds2)
c!     &           -(dv1*str2+dv1*btm2+2.0d0*(str1*btm2+btm1*str2)
c!     &           +ds1*str2+ds1*btm2+str1*ds2+str1*dv2+btm1*ds2
c!     &           +btm1*dv2)
c!     &           -(dv1*ds2+ds1*dv2+2.0d0*(str1*str2+btm1*btm2))
c!     &           +(dv1*dv2+ds1*ds2+2.0d0*(str1*str2+btm1*btm2)))
c!     &           +(Ngg*Qu*Qd+Nzz*gvugvd+Ngz2*(Qu*gvd+Qd*gvu)*0.5d0)
c!     &           *((uv1+chm1)*(dv2+str2+btm2)+(us1+chm1)*(ds2+str2+btm2)
c!     &           -(uv1+chm1)*(ds2+str2+btm2)-(us1+chm1)*(dv2+str2+btm2)
c!     &           +(dv1+str1+btm1)*(uv2+chm2)+(ds1+str1+btm1)*(us2+chm2)
c!     &           -(dv1+str1+btm1)*(us2+chm2)-(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = ((Ngg*Qu**2+Nzz*gvusq+Ngz2*Qu*gvu)
     &           *((uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)
     &           -(uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
     &           -(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
     &           +(uv1*uv2+us1*us2+2.0d0*chm1*chm2))
     &           +(Ngg*Qd**2+Nzz*gvdsq+Ngz2*Qd*gvd)*(
     &            (dv1*sv2+sv1*dv2+ds1*ss2+ss1*ds2)
     &           -(dv1*ss2+ds1*sv2+sv1*ds2+ss1*dv2)
     &           -(dv1*ds2+ds1*dv2+sv1*ss2+ss1*sv2)
     &           +(dv1*dv2+ds1*ds2+sv1*sv2+ss1*ss2))
     &           +(Ngg*Qu*Qd+Nzz*gvugvd+Ngz2*(Qu*gvd+Qd*gvu)*0.5d0)
     &           *((uv1+chm1)*(dv2+sv2+btm2)+(us1+chm1)*(ds2+ss2+btm2)
     &           -(uv1+chm1)*(ds2+ss2+btm2)-(us1+chm1)*(dv2+sv2+btm2)
     &           +(dv1+sv1+btm1)*(uv2+chm2)+(ds1+ss1+btm1)*(us2+chm2)
     &           -(dv1+sv1+btm1)*(us2+chm2)-(ds1+ss1+btm1)
     &           *(uv2+chm2)))
            
CCC   CD ai*aj piece, for uiuj+didj+ubariubarj+didj+dbaridbarj
CCC   +uiubarj+didbarj, i<>j
CCC   +ui*dj+ubari*dbarj+di*uj+dbari*ubarj+ui*dbarj+ubari*dj+di*ubarj+dbari*uj
CCC   +ui*ubari+di*dbari
CCC   +ui*ui+di*di+ubari*ubari+dbari*dbari
         elseif (lum.eq.(16.0d0)) then
c!            tlum = (Nzz*gau**2
c!     &           *((uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)+
c!     &           (uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
c!     &           +(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
c!     &           +(uv1*uv2+us1*us2+2.0d0*chm1*chm2))
c!     &           +Nzz*gad**2*((dv1*str2+str1*dv2+dv1*btm2+btm1*dv2
c!     &           +2.0d0*(str1*btm2+btm1*str2)+ds1*str2+str1*ds2
c!     &           +ds1*btm2+btm1*ds2)
c!     &           +(dv1*str2+dv1*btm2+2.0d0*(str1*btm2+btm1*str2)
c!     &           +ds1*str2+ds1*btm2+str1*ds2+str1*dv2+btm1*ds2+btm1*dv2)
c!     &           +(dv1*ds2+ds1*dv2+2.0d0*(str1*str2+btm1*btm2))
c!     &           +(dv1*dv2+ds1*ds2+2.0d0*(str1*str2+btm1*btm2)))
c!     &           +Nzz*gau*gad
c!     &           *((uv1+chm1)*(dv2+str2+btm2)+(us1+chm1)*(ds2+str2+btm2)
c!     &           +(uv1+chm1)*(ds2+str2+btm2)+(us1+chm1)*(dv2+str2+btm2)
c!     &           +(dv1+str1+btm1)*(uv2+chm2)+(ds1+str1+btm1)*(us2+chm2)  
c!     &           +(dv1+str1+btm1)*(us2+chm2)+(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = (Nzz*gau**2
     &           *((uv1*chm2+chm1*uv2+us1*chm2+chm1*us2)+
     &           (uv1*chm2+chm1*us2+chm1*uv2+us1*chm2)
     &           +(uv1*us2+us1*uv2+2.0d0*chm1*chm2)
     &           +(uv1*uv2+us1*us2+2.0d0*chm1*chm2))
     &           +Nzz*gad**2*((dv1*ss2+ss1*dv2+dv1*btm2+btm1*dv2
     &           +sv1*btm2+sv2*btm1+ss1*btm2+ss2*btm1+ds1*sv2+sv1*ds2
     &           +ds1*btm2+btm1*ds2)
     &           +(dv1*sv2+dv1*btm2+sv1*btm2+sv2*btm1+ss1*btm2+ss2*btm1
     &           +ds1*ss2+ds1*btm2+ss1*ds2+sv1*dv2+btm1*ds2+btm1*dv2)
     &           +(dv1*ds2+ds1*dv2+sv1*ss2+ss1*sv2+2.0d0*btm1*btm2)
     &           +(dv1*dv2+ds1*ds2+sv1*sv2+ss1*ss2+2.0d0*btm1*btm2))
     &           +Nzz*gau*gad
     &           *((uv1+chm1)*(dv2+sv2+btm2)+(us1+chm1)*(ds2+ss2+btm2)
     &           +(uv1+chm1)*(ds2+ss2+btm2)+(us1+chm1)*(dv2+sv2+btm2)
     &           +(dv1+sv1+btm1)*(uv2+chm2)+(ds1+ss1+btm1)*(us2+chm2)  
     &           +(dv1+sv1+btm1)*(us2+chm2)+(ds1+ss1+btm1)
     &           *(uv2+chm2)))
            
CCC   B^2 terms
         elseif (lum.eq.(27.0d0)) then
c!            tlum = (dv1*ds2+uv1*us2+str1*str2+chm1*chm2+btm1*btm2)
c!     &           *(Ngg*(2.0d0*Qu**2+3.0d0*Qd**2)
c!     &           +Nzz*(2.0d0*(gvusq+gau**2)+3.0d0*(gvdsq+gad**2))
c!     &           +Ngz2*(2.0d0*gvu*Qu+3.0d0*gvd*Qd))
            tlum = (dv1*ds2+uv1*us2+sv1*ss2+chm1*chm2+btm1*btm2)
     &           *(Ngg*(2.0d0*Qu**2+3.0d0*Qd**2)
     &           +Nzz*(2.0d0*(gvusq+gau**2)+3.0d0*(gvdsq+gad**2))
     &           +Ngz2*(2.0d0*gvu*Qu+3.0d0*gvd*Qd))
            
CCC   BC terms
         elseif (lum.eq.(29.0d0)) then
c!            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
c!     &           *(uv1*us2+chm1*chm2)
c!     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
c!     &           *(dv1*ds2+str1*str2+btm1*btm2))
            tlum = ((Ngg*Qu**2+Nzz*(gvusq+gau**2)+Ngz2*Qu*gvu)
     &           *(uv1*us2+chm1*chm2)
     &           +(Ngg*Qd**2+Nzz*(gvdsq+gad**2)+Ngz2*Qd*gvd)
     &           *(dv1*ds2+sv1*ss2+btm1*btm2))
            
         endif  
         
CCC   These are the asymmetry pieces.  Need to multiply by gvl*gal/(gvl^2+gal^2);
CCC   have absorbed gvl^2+gal^2 into definition of GammaZll.  For gamma-Z, need
CCC   to multiply by gal/gvl/4 (the 1/4 comes from the matrix element normalization)
CCC   Also need to multiply by gvq*gaq, gaq for gamma-Z
         
         asyl = dble(gvl*gal)/dble(gvl*conjg(gvl)+gal**2)
         asgz = gal/4.0d0/gvl
         
CCC   The qqb channel
CCC   gvu*gau should be dble(gvu)*gau but unnecessary here
CCC   b/c everything else is real, so is gvd*gad
         if (lum.eq.(6.0d0)) then
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*us2-us1*uv2)+(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)
     &           *(dv1*ds2-ds1*dv2))
CCC   The qg channel
         elseif (lum.eq.(7.0d0)) then
            tlum = glu2*((asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)
     &           *(dv1-ds1)+(asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1-us1))
         elseif (lum.eq.(8.0d0)) then
            tlum = 0.0d0
CCC   Axial for qiqi+qbariqbari terms
         elseif (lum.eq.(9.0d0)) then 
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*uv2-us1*us2)+(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)
     &           *(dv1*dv2-ds1*ds2))
CCC   Axial for uiuj+ubariubarj+didj+dbaridbarj, i<>j
         elseif (lum.eq.(10.0d0)) then 
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *(uv1*chm2+chm1*uv2-us1*chm2-chm1*us2)
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*str2
c!     &           +str1*dv2+dv1*btm2+btm1*dv2-ds1*str2-str1*ds2
c!     &           -ds1*btm2-btm1*ds2))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*chm2+chm1*uv2-us1*chm2-chm1*us2)
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*sv2
     &           +sv1*dv2+dv1*btm2+btm1*dv2-ds1*ss2-ss1*ds2
     &           -ds1*btm2-btm1*ds2))
CCC   The uiubarj+didbarj channel
         elseif (lum.eq.(12.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *(uv1*chm2+chm1*us2-(chm1*uv2+us1*chm2))
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*str2+dv1*btm2
c!     &           +str1*ds2+btm1*ds2-(ds1*str2+ds1*btm2+str1*dv2
c!     &           +btm1*dv2)))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*chm2+chm1*us2-(chm1*uv2+us1*chm2))
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*ss2+dv1*btm2
     &           +sv1*ds2+btm1*ds2-(ds1*sv2+ds1*btm2+ss1*dv2
     &           +btm1*dv2)))
         elseif (lum.eq.(14.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *((uv1+chm1)*(dv2+str2+btm2)-(us1+chm1)*(ds2+str2+btm2)
c!     &           +(uv1+chm1)*(ds2+str2+btm2)-(us1+chm1)*(dv2+str2+btm2))
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*
c!     &           ((dv1+str1+btm1)*(uv2+chm2)-(ds1+str1+btm1)*(us2+chm2)
c!     &           +(dv1+str1+btm1)*(us2+chm2)-(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *((uv1+chm1)*(dv2+sv2+btm2)-(us1+chm1)*(ds2+ss2+btm2)
     &           +(uv1+chm1)*(ds2+ss2+btm2)-(us1+chm1)*(dv2+sv2+btm2))
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*
     &           ((dv1+sv1+btm1)*(uv2+chm2)-(ds1+ss1+btm1)*(us2+chm2)
     &           +(dv1+sv1+btm1)*(us2+chm2)-(ds1+ss1+btm1)
     &           *(uv2+chm2)))
            
CCC   Axial for CD uiuj+ubariubarj+didj+dbaridbarj, i<>j
CCC   +uiui+didi+ubariubar+dbaridbari
         elseif (lum.eq.(17.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *(uv1*chm2+chm1*uv2-us1*chm2-chm1*us2
c!     &           +uv1*uv2-us1*us2)
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*str2
c!     &           +str1*dv2+dv1*btm2+btm1*dv2-ds1*str2-str1*ds2
c!     &           -ds1*btm2-btm1*ds2+dv1*dv2-ds1*ds2))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*chm2+chm1*uv2-us1*chm2-chm1*us2
     &           +uv1*uv2-us1*us2)
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*sv2
     &           +sv1*dv2+dv1*btm2+btm1*dv2-ds1*ss2-ss1*ds2
     &           -ds1*btm2-btm1*ds2+dv1*dv2-ds1*ds2))
            
CCC   Axial for CD uiubarj+didbarj, i<>j
CCC   +uiubari+didbari
         elseif (lum.eq.(18.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *(uv1*chm2+chm1*us2-(chm1*uv2+us1*chm2)
c!     &           +uv1*us2-us1*uv2)
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*str2+dv1*btm2
c!     &           +str1*ds2+btm1*ds2+dv1*ds2-ds1*dv2-(ds1*str2+ds1*btm2
c!     &           +str1*dv2+btm1*dv2)))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*chm2+chm1*us2-(chm1*uv2+us1*chm2)
     &           +uv1*us2-us1*uv2)
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)*(dv1*ss2+dv1*btm2
     &           +sv1*ds2+btm1*ds2+dv1*ds2-ds1*dv2-(ds1*sv2+ds1*btm2
     &           +ss1*dv2+btm1*dv2)))
            
CCC   Axial for CD, vu*ad*u1*d2+au*vd*d1*u2
         elseif (lum.eq.(19.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
c!     &           *((uv1+chm1)*(dv2+str2+btm2)-(us1+chm1)*(ds2+str2+btm2)
c!     &           +(uv1+chm1)*(ds2+str2+btm2)-(us1+chm1)*(dv2+str2+btm2))
c!     &           +(asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
c!     &           *((dv1+str1+btm1)*(uv2+chm2)-(ds1+str1+btm1)*(us2+chm2)
c!     &           +(dv1+str1+btm1)*(us2+chm2)-(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = ((asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
     &           *((uv1+chm1)*(dv2+sv2+btm2)-(us1+chm1)*(ds2+ss2+btm2)
     &           +(uv1+chm1)*(ds2+ss2+btm2)-(us1+chm1)*(dv2+sv2+btm2))
     &           +(asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
     &           *((dv1+sv1+btm1)*(uv2+chm2)-(ds1+ss1+btm1)*(us2+chm2)
     &           +(dv1+sv1+btm1)*(us2+chm2)-(ds1+ss1+btm1)
     &           *(uv2+chm2)))
            
CCC   Axial for CD, au*vd*u1*d2+vu*ad*d1*u2
CCC   Note that for these, it is the qqbar MEs that get a minus, not qbarq
         elseif (lum.eq.(20.0d0)) then
c!            tlum = ((asyl*Nzz*gvd*gau+Ngz2*asgz*Qd*gau)
c!     &           *((uv1+chm1)*(dv2+str2+btm2)-(us1+chm1)*(ds2+str2+btm2)
c!     &           -(uv1+chm1)*(ds2+str2+btm2)+(us1+chm1)*(dv2+str2+btm2))
c!     &           +(asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
c!     &           *((dv1+str1+btm1)*(uv2+chm2)-(ds1+str1+btm1)*(us2+chm2)
c!     &           -(dv1+str1+btm1)*(us2+chm2)+(ds1+str1+btm1)
c!     &           *(uv2+chm2)))
            tlum = ((asyl*Nzz*gvd*gau+Ngz2*asgz*Qd*gau)
     &           *((uv1+chm1)*(dv2+sv2+btm2)-(us1+chm1)*(ds2+ss2+btm2)
     &           -(uv1+chm1)*(ds2+ss2+btm2)+(us1+chm1)*(dv2+sv2+btm2))
     &           +(asyl*Nzz*gvu*gad+Ngz2*asgz*Qu*gad)
     &           *((dv1+sv1+btm1)*(uv2+chm2)-(ds1+ss1+btm1)*(us2+chm2)
     &           -(dv1+sv1+btm1)*(us2+chm2)+(ds1+ss1+btm1)
     &           *(uv2+chm2)))


CCC   B2 channel
         elseif (lum.eq.(28.0d0)) then
c!            tlum = (dv1*ds2+uv1*us2+str1*str2+chm1*chm2+btm1*btm2)
c!     &           *(2.0d0*(asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           +3.0d0*(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd))
            tlum = (dv1*ds2+uv1*us2+sv1*ss2+chm1*chm2+btm1*btm2)
     &           *(2.0d0*(asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           +3.0d0*(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd))
 
CCC   The BC channel   
         elseif (lum.eq.(30.0d0)) then
c!            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
c!     &           *(uv1*us2+chm1*chm2)
c!     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)
c!     &           *(dv1*ds2+str1*str2+btm1*btm2))
            tlum = ((asyl*Nzz*gvu*gau+Ngz2*asgz*gau*Qu)
     &           *(uv1*us2+chm1*chm2)
     &           +(asyl*Nzz*gvd*gad+Ngz2*asgz*gad*Qd)
     &           *(dv1*ds2+sv1*ss2+btm1*btm2))
            
         endif
         
      endif

      lumin = tlum

      END
