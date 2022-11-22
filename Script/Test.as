class ATestActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent Root;

    UPROPERTY(DefaultComponent)
    USphereComponent SphereComp;
    default SphereComp.SphereRadius = 200.f;

    UPROPERTY(DefaultComponent)
    UStaticMeshComponent Mesh;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SphereComp.OnComponentBeginOverlap.AddUFunction(this, n"HandleBeginOverlap");
        SphereComp.OnComponentEndOverlap.AddUFunction(this, n"HandleEndOverlap");
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        
    }


    UFUNCTION()
    private void HandleEndOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                                  UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        // FString Message = f"{OtherActor=} entered!";
        // Print(Message);
        Overlapped();
    }

    UFUNCTION()
    private void HandleBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                                    UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                                    FHitResult&in SweepResult)
    {

    }

    void Overlapped()
    {
        Print("Overlapped base");
        BP_Overlapped();
    }

    UFUNCTION(BlueprintEvent, DisplayName = "Overlapped")
    void BP_Overlapped(){}
}

UFUNCTION()
void GlobalFunction()
{
    Print("Called global function");
}