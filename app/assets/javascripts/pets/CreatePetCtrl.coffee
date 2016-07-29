
class CreatePetCtrl

    constructor: (@$log, @$location,  @PetService) ->
        @$log.debug "constructing CreatePetController"
        @pet = {}

    createPet: () ->
        @$log.debug "createPet()"
        @pet.active = true
        @PetService.createPet(@pet)
        .then(
            (data) =>
                @$log.debug "Promise returned #{data} Pet"
                @pet = data
                @$location.path("/")
            ,
            (error) =>
                @$log.error "Unable to create Pet: #{error}"
            )

controllersModule.controller('CreatePetCtrl', ['$log', '$location', 'PetService', CreatePetCtrl])