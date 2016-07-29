
class PetService

    @headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
    @defaultConfig = { headers: @headers }

    constructor: (@$log, @$http, @$q) ->
        @$log.debug "constructing PetService"

    listPets: () ->
        @$log.debug "listPets()"
        deferred = @$q.defer()

        @$http.get("/pets")
        .success((data, status, headers) =>
                @$log.info("Successfully listed Pets - status #{status}")
                deferred.resolve(data)
            )
        .error((data, status, headers) =>
                @$log.error("Failed to list Pets - status #{status}")
                deferred.reject(data)
            )
        deferred.promise

    createPet: (pet) ->
        @$log.debug "createPet #{angular.toJson(pet, true)}"
        deferred = @$q.defer()

        @$http.post('/pet', pet)
        .success((data, status, headers) =>
                @$log.info("Successfully created Pet - status #{status}")
                deferred.resolve(data)
            )
        .error((data, status, headers) =>
                @$log.error("Failed to create pet - status #{status}")
                deferred.reject(data)
            )
        deferred.promise

    updatePet: (name, sex, pet) ->
      @$log.debug "updatePet #{angular.toJson(pet, true)}"
      deferred = @$q.defer()

      @$http.put("/pet/#{name}/#{sex}", pet)
      .success((data, status, headers) =>
              @$log.info("Successfully updated Pet - status #{status}")
              deferred.resolve(data)
            )
      .error((data, status, header) =>
              @$log.error("Failed to update pet - status #{status}")
              deferred.reject(data)
            )
      deferred.promise

    deletePet: (name, sex, pet) ->
      @$log.debug "deletePet #{angular.toJson(pet, true)}"
      deferred = @$q.defer()

      @$http.put("/pet/#{name}/#{sex}", pet)
      .success((data, status, headers) =>
              @$log.info("Successfully deleted Pet - status #{status}")
              deferred.resolve(data)
            )
      .error((data, status, header) =>
              @$log.error("Failed to delete pet - status #{status}")
              deferred.reject(data)
            )
      deferred.promise

servicesModule.service('PetService', ['$log', '$http', '$q', PetService])