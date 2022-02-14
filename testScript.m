A = 1:4;
a = grayHistogram("images/flask.png", "png");

bar(a);
imhist(rgb2gray(imread("./images/flask.png")));