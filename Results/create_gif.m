% Define a cell array of image filenames
image_files = {'Original_Image.png', 'Image_with_BoundingBox.png'};

% Specify the GIF output filename
gif_filename = 'GIF/Car_Image.gif';

% Call the function to create the GIF
createGif(image_files, gif_filename);

%% 
% Define a cell array of image filenames
image_files = {'Cropped_License_Plate.png', 'Binary_Image_Post_Processing.png', ...
               'Small_Objects_Removed.png', 'Large_Objects_Removed.png', ...
               'Number_Plate.png', 'Final_Number_Plate.png'};

% Specify the GIF output filename
gif_filename = 'GIF/Number_Plate_Image.gif';

% Call the function to create the GIF
createGif(image_files, gif_filename);

%%
function createGif(image_files, gif_filename)
    % Create a GIF from a list of image files
    % Inputs:
    %   image_files - cell array of image filenames (e.g., {'img1.png', 'img2.png'})
    %   gif_filename - string specifying the output GIF filename (e.g., 'output.gif')

    % Loop through all the image files
    for k = 1:length(image_files)
        % Read the current image
        current_image = imread(image_files{k});
        
        % Convert the current image to an indexed image
        [imind, cm] = rgb2ind(current_image, 256);
        
        % Write the first frame or append subsequent frames
        if k == 1
            % Write the first frame (initialize the GIF)
            imwrite(imind, cm, gif_filename, 'gif', 'Loopcount', inf, 'DelayTime', 1);
        elseif k == length(image_files)
            imwrite(imind, cm, gif_filename, 'gif', 'WriteMode', 'append', 'DelayTime', 2);
        else
            % Append subsequent frames to the GIF
            imwrite(imind, cm, gif_filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1);
        end
    end
    
    disp('GIF created successfully.');
end



