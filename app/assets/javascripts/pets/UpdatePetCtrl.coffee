class UpdatePetCtrl

  constructor: (@$log, @$location, @$routeParams, @PetService) ->
      @$log.debug "constructing UpdatePetController"
      @pet = {}
      @findPet()

  updatePet: () ->
      @$log.debug "updatePet()"
      @pet.active = true
      @PetService.updatePet(@$routeParams.name, @$routeParams.sex, @pet)
      .then(
          (data) =>
            @$log.debug "Promise returned #{data} Pet"
            @pet = data
            @$location.path("/")
        ,
        (error) =>
            @$log.error "Unable to update Pet: #{error}"
      )

  findPet: () ->
      # route params must be same name as provided in routing url in app.coffee
      name = @$routeParams.name
      sex = @$routeParams.sex
      @$log.debug "findPet route params: #{name} #{sex}"

      @PetService.listPets()
      .then(
        (data) =>
          @$log.debug "Promise returned #{data.length} Pets"

          # find a pet with the name of name and sex
          # as filter returns an array, get the first object in it, and return it
          @pet = (data.filter (pet) -> pet.name is name and pet.sex is sex)[0]
      ,
        (error) =>
          @$log.error "Unable to get Pets: #{error}"
      )

controllersModule.controller('UpdatePetCtrl', ['$log', '$location', '$routeParams', 'PetService', UpdatePetCtrl])