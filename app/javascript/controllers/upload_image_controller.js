import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="upload-image"
export default class extends Controller {
    // static targets = ['camera'];
    connect() {
        console.log("Connected");
        // if (video) {
        //     navigator.mediaDevices.getUserMedia(constraints).then((stream) => {
        //         video.srcObject = stream;
        //     });
        // }
    }

    upload() {
        const filePicker = document.querySelector('#uploader');

        if (!filePicker || !filePicker.files
            || filePicker.files.length <= 0) {
            reject('No file selected.');
            return;
        }
        const myFile = filePicker.files[0];
        console.log(myFile);
    }
}
