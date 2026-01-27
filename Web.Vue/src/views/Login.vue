<!-------------------------------------------------- script -------------------------------------------------->
<script setup>
import Password from '../components/Password.vue';


/************************* emits *************************/
/************************* computed *************************/
/************************* functions *************************/
function login() {
  console.log("Login button clicked");
}
</script>

<!-------------------------------------------------- template -------------------------------------------------->
<template>
  <div>
    <Card title="Login" saveText="Login" cancelText="" @onSubmit="login">
      <Input label="Username" />
      <Password label="Password" />
    </Card>
  </div>
</template>

<!-------------------------------------------------- style -------------------------------------------------->
<style scoped></style>
