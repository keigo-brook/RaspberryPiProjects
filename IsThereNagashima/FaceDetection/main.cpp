#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

int main() {
    const char* cascade_path = "./FaceDetection/haarcascade_frontalface_default.xml";
    const char* img_path = "./nagashima.png";

    Mat im = imread(img_path);
    if (im.empty()) {
        cout << "IE";
        return -1;
    }
    CascadeClassifier cascade;
    if (!cascade.load(cascade_path)) {
        cout << "e";
        return -1;
    }
    vector<Rect> faces;
    cascade.detectMultiScale(im, faces, 1.2, 2, CV_HAAR_SCALE_IMAGE, Size(30, 30));

    vector<Rect>::const_iterator r = faces.begin();
    for (; r != faces.end(); ++r) {
        rectangle(im, Point(r->x, r->y), Point(r->x + r->width, r->y + r->height), Scalar(0, 0, 200), 3, CV_AA);
    }
    imwrite("./public/nagashima.png", im);
    cout << "Done" << endl;
    return 0;
}
