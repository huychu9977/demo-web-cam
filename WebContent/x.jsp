<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web  camera - Testing</title>

    <script>

        // Put event listeners into place
        window.addEventListener("DOMContentLoaded", function () {
        	const video = document.getElementById('video');
        	const canvas = document.getElementById('canvas');
        	const snap = document.getElementById("snap");
        	const errorMsgElement = document.querySelector('span#errorMsg');

        	const constraints = {
        	  audio: false,
        	  video: {
        	    width: 1280, height: 720
        	  }
        	};

        	// Access webcam
        	async function init() {
        	  try {
        	    const stream = await navigator.mediaDevices.getUserMedia(constraints);
        	    handleSuccess(stream);
        	  } catch (e) {
        	    errorMsgElement.innerHTML = `navigator.getUserMedia error:${e.toString()}`;
        	  }
        	};

        	// Success
        	function handleSuccess(stream) {
        	  window.stream = stream;
        	  video.srcObject = stream;
        	}

        	// Load init
        	init();

        	// Draw image
        	var context = canvas.getContext('2d');
        	snap.addEventListener("click", function() {
        		context.drawImage(video, 0, 0, 640, 480);
        		document.getElementById('ImageData').value = canvas.toDataURL("image/png");
        	});


        }, false);

    </script>



</head>
<body>
    <h1>Capture Image using Camera!</h1>
	<!-- Stream video via webcam -->
	<div class="video-wrap">
	    <video id="video" playsinline autoplay></video>
	</div>
	
	<!-- Trigger canvas web API -->
	<div class="controller">
	    <button id="snap">Capture</button>
	</div>
	
	<!-- Webcam video snapshot -->
	<canvas id="canvas" width="640" height="480"></canvas>
	<form action="/TestCapature/take-picture" method="post">
		<input type="hidden" name="ImageData" id="ImageData" />
		<input type="submit" value="SSSS">
	</form>
</body>
</html>

