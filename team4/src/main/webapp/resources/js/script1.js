

const siren = document.getElementById('siren')

const video = document.getElementById('video')

Promise.all([
	faceapi.nets.tinyFaceDetector.loadFromUri('./resources/js/models'),
	faceapi.nets.faceLandmark68Net.loadFromUri('./resources/js/models'),
	faceapi.nets.faceRecognitionNet.loadFromUri('./resources/js/models'),
	faceapi.nets.faceExpressionNet.loadFromUri('./resources/js/models')
]).then(startVideo)

function startVideo() {
	navigator.getUserMedia(
		{video:{}},
		stream => video.srcObject = stream,
		err => console.error(err)
	)
}
  var n = 0;
video.addEventListener('play', () => {
	const canvas = faceapi.createCanvasFromMedia(video)
	document.body.append(canvas)
	const displaySize = { width: video.width, height: video.height }
	faceapi.matchDimensions(canvas, displaySize)
	setInterval(async () => {
		const detections = await faceapi.detectAllFaces(video,
		new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks().withFaceExpressions()
		//console.log(detections.length)
		
		if(detections.length == '0'){
			n += 1;
			
		}
		if(n > 50){
			alert('공부해라~!')
			n=0;
		}
		console.log(n)
		const resizedDetections = faceapi.resizeResults(detections, displaySize)
		canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)
		faceapi.draw.drawDetections(canvas, resizedDetections)
		//faceapi.draw.drawFaceLandmarks(canvas, resizedDetections)
		//faceapi.draw.drawFaceExpressions(canvas, resizedDetections)
	},100)
});