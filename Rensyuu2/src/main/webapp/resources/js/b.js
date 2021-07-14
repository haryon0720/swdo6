/**
 * 
 */
 

var slides = document.querySelector('.slides'),
	slide = document.querySelectorAll('.slides li'),
	currentIdx = 0,
	slideCount = slide.length,
	prevBtn = document.querySelector('.prev'),
	slideWidth = 300,
	slideMargin = 30,
	nextBtn = document.querySelector('.next');
 
	slides.style.width  = (slideWidth + slideMargin) * slideCount - slideMargin + 'px'; 
	 
	function moveSlide(num){
		slides.style.left = -num * 330 + 'px';
		currentIdx = num;
	}
	
	nextBtn.addEventListener('click', function(){
		
	if(currentIdx < slideCount -3){
		if(currentIdx == 3){
	moveSlide(2);
	}
		moveSlide(currentIdx +1 );
		console.log(currentIdx);
	} 
	});
	
		prevBtn.addEventListener('click', function(){
	if(currentIdx ==0){
		moveSlide(1);
	}
	if(currentIdx < slideCount +3){
		
		moveSlide(currentIdx -1 );
		console.log(currentIdx);
	}  
	});