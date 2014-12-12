function img = mk_line(x,x_center,d,ker)
[nx,ny,nz] = size(x);
[nkx, nky, nkz] = size(ker);
for sg = 1:2
    v = d*(sg*2-3);
    flag = true;
    c = x_center;
    while true
        ix = ceil( c(1)+[1:nkx]-1 );
        iy = ceil( c(2)+[1:nky]-1 );
        iz = ceil( c(3)+[1:nkz]-1 );
        flag = min(ix)<1 | max(ix)>nx ...
            | min(iy)<1 | max(iy)>ny ...
            | min(iz)<1 | max(iz)>nz;
        if flag
            break
        end
        x0 = x(ix,iy,iz);
        x1 = max( x0, ker );
        x( ix, iy, iz ) = x1;
        c = c + v;
    end
end
img = x;
