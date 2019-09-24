//경고소리
const siren = document.getElementById('siren')
//얼굴인식하면
const video = document.getElementById('video')
//강의 비디오 화면
const video2 = document.getElementById('video2')

//비디와 끝났을때 이벤트
video2.addEventListener('ended', event, false);

//강의를 끝내고 문제풀이 페이지로 갈것인지 물음
function event(e){
	var ins_num = document.getElementById('hid').value
	if(confirm("강의가 끝났습니다. 문제풀이 하시겠습니까?")){
		 location.href="goHWST?ins_num="+ins_num;
	}
}

Promise.all([
	faceapi.nets.tinyFaceDetector.loadFromUri('../resources/js/models'),
	faceapi.nets.faceLandmark68Net.loadFromUri('../resources/js/models'),
	faceapi.nets.faceRecognitionNet.loadFromUri('../resources/js/models'),
	faceapi.nets.faceExpressionNet.loadFromUri('../resources/js/models')
]).then(startVideo)

function startVideo() {
	navigator.getUserMedia(
		{video:{}},
		stream => video.srcObject = stream,
		err => console.error(err)
	)
}
  var n = 0;//얼굴인식되지 않을 경우 값이 증가될 변수
video.addEventListener('play', () => {
	const canvas = faceapi.createCanvasFromMedia(video)
	document.body.append(canvas)
	const displaySize = { width: video.width, height: video.height }
	faceapi.matchDimensions(canvas, displaySize)
	setInterval(async () => {
	
		//얼굴 인식 정보
		const detections = await faceapi.detectAllFaces(video,
		new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks().withFaceExpressions()
		//console.log(detections)
		
		//얼굴 인식정보가 없을때, 즉 얼굴이 인식이 되지 않을때  변수 n이 1씩 증가
		if(detections.length == '0'){
			n += 1;
		}
		//n이 50이 되면 비디오가 멈추고 사이렌소리 플레이와 함께 alert창 띄움 
		if(n > 50){
			video2.pause();
			siren.play();
			alert('학습에 집중해 주세요~!')
			//다음 동작을 위해 n 초기화
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