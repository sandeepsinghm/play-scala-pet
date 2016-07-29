
class PetCtrl

    constructor: (@$log, @PetService) ->
        @$log.debug "constructing PetController"
        @pets = []
        @getAllPets()

    getAllPets: () ->
        @$log.debug "getAllPets()"

        @PetService.listPets()
        .then(
            (data) =>
                @$log.debug "Promise returned #{data.length} Pets"
                @pets = data
            ,
            (error) =>
                @$log.error "Unable to get Pets: #{error}"
            )

controllersModule.controller('PetCtrl', ['$log', 'PetService', PetCtrl])