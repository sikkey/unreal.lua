local CMCharacterBase = require "character.cmcharacterbase"
local CMCharacter = Inherit(CMCharacterBase, ACatchMeCharacter)

function CMCharacter:Ctor()
	local CapsuleComponent = self.CapsuleComponent
	CapsuleComponent.CapsuleRadius = 42
	CapsuleComponent.CapsuleHalfHeight = 96

	self.bUseControllerRotationPitch = false
	self.bUseControllerRotationYaw = false
	self.bUseControllerRotationRoll = false

	local CharacterMovement = self.CharacterMovement 
	
	CharacterMovement.bOrientRotationToMovement = true
	CharacterMovement.RotationRate = FRotator.New(0, 640, 0)
	CharacterMovement.bConstrainToPlane = true
	CharacterMovement.bSnapToPlaneAtStart = true

	local CameraBoom = USpringArmComponent.CreateDefaultSubobject(self, "CameraBoom")
	self.CameraBoom = CameraBoom
	local RootComponent = self.RootComponent
	CameraBoom.AttachParent = RootComponent
	CameraBoom.bAbsoluteRotation = true
	CameraBoom.TargetArmLength = 800
	CameraBoom.RelativeRotation = FRotator.New(-60, 0, 0)
	CameraBoom.bDoCollisionTest = false 

										  
	local TopDownCameraComponent = UCameraComponent.CreateDefaultSubobject(self, "TopDownCamera")
	self.TopDownCameraComponent = TopDownCameraComponent
	TopDownCameraComponent.AttachParent = CameraBoom
	TopDownCameraComponent.AttachSocketName = "SpringEndpoint"
	TopDownCameraComponent.bUsePawnControlRotation = false

	local PrimaryActorTick = self.PrimaryActorTick
	PrimaryActorTick.bCanEverTick = true
	PrimaryActorTick.bStartWithTickEnabled = true
end

function CMCharacter:BeginPlay( )
end

function CMCharacter:Tick(delta)
end

return CMCharacter