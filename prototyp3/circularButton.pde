//	circularButton.pde
//	runder Button

class CircularButton extends Button{

	private float radius;
	private int status;
	private float sizing;


	CircularButton( PVector _position, color _color, color _colorpressed){

		super( _position, _color, _colorpressed );
		radius		= 250;

	}	

	CircularButton( PVector _position, color _color, color _colorpressed, int _status){

		super( _position, _color, _colorpressed );
		radius		= 250;
		status 		= _status;

	}


	public void update(){

		sizing += 0.02;

		radius = 250 + sin( sizing ) * 35;

		if( checkPressed() ){
			changeButtonStatus( true );
		}

		if( checkReleased() ){
			if( status != 11 ){
				myEvent.changeApplicationStatus( status );
			}
			else{
				restartSimulation();
			}
			changeButtonStatus( false );
		}

	}


	public void render(){

		noStroke();
		if( pressed ){
			fill( myColorPressed ); 
		}else{
			fill( myColor );
		}
		if( radius > 0 ){
		if( status != 11 ){
		ellipse( 
			position.x - sim2.cam.getPosition().x, 
			position.y - sim2.cam.getPosition().y, 
			radius, 
			radius 
			);
		fill( 90, 90, 90, 200 );
		ellipse( 
			position.x - sim2.cam.getPosition().x, 
			position.y - sim2.cam.getPosition().y, 
			radius + 50 , 
			radius + 50 
			);
			image( 
				playImage, 
				position.x - sim2.cam.getPosition().x, 
				position.y - sim2.cam.getPosition().y, 
				radius-100, 
				radius-100 
				);
		}
		else{
		ellipse( 
			position.x, 
			position.y, 
			radius - 100, 
			radius - 100 
			);
		fill( 90, 90, 90, 200 );
		ellipse( 
			position.x, 
			position.y, 
			radius -50 , 
			radius - 50 
			);
			image( 
				replayImage, 
				position.x-5, 
				position.y, 
				radius-150, 
				radius-150 
				);
		}

		}
	}


	public boolean checkPressed(){

		//	Wenn die Funktion ausgeführt wird, wird überprüft ob die Maus beim Zeitpunkt
		//	des Klicks über dem Button war.
		if( 	
			PVector.dist( new PVector( mouseX, mouseY ), position ) <= radius && mousePressed
		){

			pressedBefore = true;
			return true;

		}

		return false;

	}


	public void reduceSize(){

		if( radius >= 0 ){
			radius -= 10.0;
		}

	}

}