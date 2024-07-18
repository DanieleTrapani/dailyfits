import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="landing"
export default class extends Controller {
  static targets = ["image"];
  connect() {
    this.startImageRotation();
  }

  startImageRotation() {
    const images = [
      "https://res.cloudinary.com/drkv46whi/image/upload/v1694015139/landingimage2_v96xnm.png",
      "https://res.cloudinary.com/drkv46whi/image/upload/v1694015138/landingimage3_hlkntq.png",
      "https://res.cloudinary.com/drkv46whi/image/upload/v1694015138/landingimage4_m8qwge.png",
      "https://res.cloudinary.com/drkv46whi/image/upload/v1694015138/landingimage5_kruqph.png",
      "https://res.cloudinary.com/drkv46whi/image/upload/v1694015139/landingimage1_qftqns.png",
    ];

    let counter = 0;
    setInterval(() => {
      this.imageTarget.src = images[counter];
      if (counter == 4) {
        counter = 0;
      } else {
        counter += 1;
      }
    }, 3000);
  }
}
