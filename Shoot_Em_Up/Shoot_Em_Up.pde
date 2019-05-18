void setup(){}

void draw(){}

interface Displayable{}

interface Moveable{}

interface Damageable{}

abstract class Living implements Displayable,Moveable,Damageable{}

class Player extends Living{}

class Enemy extends Living{}

class Boss extends Enemy{}

class TankEnemy extends Enemy{}

class Obstacle implements Displayable,Damageable{}

class MovingObs extends Obstacle implements Moveable{}

abstract class Projectile implements Moveable,Displayable{}

class Bullets extends Projectile{}

class Bombs extends Projectile{}

abstract class Powerups implements Moveable,Displayable{}

class Health extends Powerups{}
