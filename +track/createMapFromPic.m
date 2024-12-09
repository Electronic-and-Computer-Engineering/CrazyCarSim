function [map,grayimage] = createMapFromPic(path,size,resolution,inflatedistance)

% Import Image
image = imread(path);

% Convert to grayscale and then black and white image based on arbitrary
% threshold.
grayimage = rgb2gray(image);
grayimage = imresize(grayimage,size);

bwimage = grayimage < 0.5;

% grayimage = imcomplement(grayimage);
% grayimage = mat2gray(grayimage);

% Use black and white image as matrix input for binary occupancy grid
map = robotics.BinaryOccupancyGrid(bwimage,resolution);
if inflatedistance > 0
    inflate(map,inflatedistance);
end
    grayimage = imcomplement((uint8(255 * occupancyMatrix(map))));
    grayimage = (uint8(255 * occupancyMatrix(map)));
end


