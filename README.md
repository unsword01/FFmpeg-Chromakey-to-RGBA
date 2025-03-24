# FFmpeg-Chromakey-to-RGBA
Convert file with Chromakey background to QT RLE with Alpha Channel

First converts the source to RGBA  and then uses the geq filter to process each pixel, setting saturated Green Pixels to Black with transparent Alpha, passing Red, Blue and non-saturated Green pixels as-is

Output is Quicktime RLE format which supports Alpha channel
