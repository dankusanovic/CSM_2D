function MESH = ComputeSeismicVector(MESH, dir)
    %Total number of degree of freedom
    nk = MESH.STORAGE.total;

    %Creates the seismic influence vector
    Lw = zeros(nk,1);

    %Assigns ones in the corresponding direction
    for k = 1:length(MESH.NODE)
        total = MESH.NODE(k,1).total;

        %Seismic direction
        if dir == 1
            Lw(total(1),1) = 1;
        elseif dir == 2
            Lw(total(2),1) = 1;
        end

    end

    %Stores the information
    MESH.MODEL.Lw = Lw;
end