// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import MealFieldsController from "./meal_fields_controller"
import DisplayController from "./display_controller"
application.register("meal-fields", MealFieldsController)
application.register("display", DisplayController)
