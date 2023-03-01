function plotEigenModes(MESH,mode,A)
    %Obtaines elements and coordinates
    [LINES, QUADS, COORD, dof] = renderData(MESH);

    %Plots the animation
    npoints = 500;
    n    = linspace(0, 4*pi, npoints);
    phi  = MESH.MODEL.EIGEN.phi(:,mode);
    PHI  = phi(dof);
    xmax = [min(COORD(:,1)), max(COORD(:,1))] + A*[-abs(PHI(:,1)), abs(PHI(:,1))];
    zmax = [min(COORD(:,2)), max(COORD(:,2))] + A*[-abs(PHI(:,2)), abs(PHI(:,2))];

    %Generates the mesh visualization
    q = patch('Vertices', COORD, 'Faces', QUADS, 'facecolor', [0.675 0.925 1]);
    f = patch('Vertices', COORD, 'Faces', LINES, 'facecolor', [1 1 1], 'Linewidth', 2);

    %Plots the selected mode
    for k = 1:npoints
        set(q,'Vertices', COORD + A*sin(n(k))*phi(dof));
        set(f,'Vertices', COORD + A*sin(n(k))*phi(dof));
        axis equal;
        axis off;
        xlim(xmax);
        ylim(zmax);
        drawnow;
    end
end

function [LINES, QUADS, COORD, dof] = renderData(MESH)
    nNodes = length(MESH.NODE);
    nElems = length(MESH.ELEMENT);
    
    %Computes the center of the model
    xcm = zeros(1, 2);
    dof = zeros(nNodes, 2);
    for k = 1:nNodes
        xcm = xcm + MESH.NODE(k,1).coords;
        dof(k,:) = MESH.NODE(k,1).total(1:2);
    end
    xcm = xcm/length(MESH.NODE);
    
    %Centers the model at mid-point
    COORD = zeros(nNodes, 2);
    for k = 1:nNodes
        COORD(k,:) = MESH.NODE(k,1).coords - xcm;
    end
    
    %Gets the elements according to geometry
    LINES = [];
    QUADS = [];
    for k = 1:nElems
        conn = MESH.ELEMENT(k,1).node;

        if length(conn) == 2
            LINES = [LINES;[conn(1), conn(2), conn(2), conn(1)]];
        elseif length(conn) == 4
            QUADS = [QUADS;[conn(1), conn(2), conn(3), conn(4)]];
        end
    end
end
