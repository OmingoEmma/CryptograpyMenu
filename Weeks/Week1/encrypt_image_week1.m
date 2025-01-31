function encrypt_image_week1(image_path, output_path)
    img = imread(image_path); % Read image
    key = uint8(50); % XOR key

    % Encrypt image using XOR operation
    encrypted_image = bitxor(img, key);

    % Save encrypted image
    imwrite(encrypted_image, output_path);
    
    fprintf('Image encrypted and saved as: %s\n', output_path);
end
