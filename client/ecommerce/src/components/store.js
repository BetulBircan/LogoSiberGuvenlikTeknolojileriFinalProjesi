import { reactive } from 'vue'

export const store = reactive({
    categoryId: 0,

    added(param) {
        this.categoryId=param;
      }
})