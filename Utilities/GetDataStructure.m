function [Nodes, Elements, Loads, Bodies, Library] = GetDataStructure(meshfile)
    %Pre-define element dictionary
    Library = struct('name', [], 'me', [], 'ke', [], 'fe', [], 'ndof', []);
    Library(3,1) = Library;

    Library(1).name = 'Truss';
    Library(1).ndof = 4;
    Library(1).ke = @leTrussK;
    Library(1).me = @leTrussM;
    Library(1).fe = @leTrussF;

    Library(2).name = 'Frame';
    Library(2).ndof = 6;
    Library(2).ke = @leFrameK;
    Library(2).me = @leFrameM;
    Library(2).fe = @leFrameF;

    Library(3).name = 'Quad';
    Library(3).ndof = 8;
    Library(3).ke = @leQuadK;
    Library(3).me = @leQuadM;
    Library(3).fe = @leQuadF;

    %Computes number of attributes
    nNodes = 0;
    nElems = 0;
    nLoads = 0;
    nBodies = 0;
    
    nlines = length(meshfile);
    for k = 1:nlines
        data = split(meshfile{1,k});
        if strcmpi(data{1},'NODE')
            nNodes = nNodes + 1;
        elseif strcmpi(data{1},'ELEMENT')
            nElems = nElems + 1;
        elseif strcmpi(data{1},'FORCE')
            if strcmpi(data{3},'POINT')
                nLoads = nLoads + 1;
            elseif strcmpi(data{3},'VOLUME')
                nBodies = nBodies + 1;
            end
        end
    end

    %Creates empty structures
    Nodes  = [];
    if nNodes > 0
        Nodes  = struct('ndof', [], 'coords', [], 'free', [], 'total', []);
        Nodes(nNodes,1) = Nodes;
    end

    Elements  = [];
    if nElems > 0
        Elements  = struct('name', [], 'node', [], 'prop', [], 'npoints', []);
        Elements(nElems,1) = Elements;
    end

    Loads = []; 
    if nLoads > 0
        Loads = struct('name', [], 'value', [], 'dir', [], 'node', []); 
        Loads(nLoads,1) = Loads;
    end

    Bodies = [];
    if nBodies > 0
        Bodies = struct('name', [], 'value', [], 'dir', [], 'element', []); 
        Bodies(nBodies,1) = Bodies;
    end
end